//
//  CameraController.swift
//  FTNews
//
//  Created by Andrey Leganov on 20.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import AVFoundation
import UIKit
import Photos

enum CameraControllerError: Swift.Error { 
    case captureSessionAlreadyRunning
    case captureSessionIsMissing
    case inputsAreInvalid
    case invalidOperation
    case noCamerasAvailable
    case unknown
}

enum CameraPosition {
    case front
    case rear
}

enum CaptureState {
    case idle
    case start
    case capturing
    case end
}

class CameraController: NSObject {
        
    var captureSession: AVCaptureSession?
    
    var frontCamera: AVCaptureDevice?
    var rearCamera: AVCaptureDevice?
    
    var currentCameraPosition: CameraPosition?
    var cameraInput: AVCaptureDeviceInput?
    
    var videoOutput: AVCaptureVideoDataOutput?
    var videoOutputQueue: DispatchQueue = DispatchQueue(label: "com.test.video")
    var assetWriter: AVAssetWriter?
    var assetWriterInput: AVAssetWriterInput?
    var assetWriterAdapter: AVAssetWriterInputPixelBufferAdaptor?
    var fileName: String = ""
    var time: Double = 0.0
    var state: CaptureState = .idle
 
    var flashMode = AVCaptureDevice.FlashMode.off
    
    // MARK: - Prepare
    
    func prepare(completionHandler: @escaping (Error?) -> Void) {
        
        DispatchQueue(label: "prepare").async {
            do {
                self.createCaptureSession()
                try self.configureCaptureDevices()
                try self.configureDeviceInputs()
                try self.configureVideoOutput()
            }
                
            catch {
                DispatchQueue.main.async {
                    completionHandler(error)
                }
                
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(nil)
            }
        }
        
    }
    
    func createCaptureSession() {
        
        self.captureSession = AVCaptureSession()
    }
    
    func configureCaptureDevices() throws {
        let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .unspecified)
        let cameras = session.devices.compactMap { $0 }
        
        guard !cameras.isEmpty else {
            throw CameraControllerError.noCamerasAvailable
        }
        
        for camera in cameras {
            if camera.position == .front {
                self.frontCamera = camera
            }
            if camera.position == .back {
                self.rearCamera = camera
                
                try camera.lockForConfiguration()
                camera.focusMode = .continuousAutoFocus
                camera.unlockForConfiguration()
            }
        }
    }
    
    func configureDeviceInputs() throws {
        
        guard let captureSession = self.captureSession else {
            throw CameraControllerError.captureSessionIsMissing
        }
        
        if let rearCamera = self.rearCamera {
            self.cameraInput = try AVCaptureDeviceInput(device: rearCamera)
            
            if captureSession.canAddInput(cameraInput!) {
                captureSession.addInput(cameraInput!)
            }
            
            self.currentCameraPosition = .rear
            
        } else if let frontCamera = self.frontCamera {
            self.cameraInput = try AVCaptureDeviceInput(device: frontCamera)
            
            if captureSession.canAddInput(cameraInput!) {
                captureSession.addInput(cameraInput!)
            } else {
                throw CameraControllerError.inputsAreInvalid
            }
            
            self.currentCameraPosition = .front
            
        } else {
            throw CameraControllerError.noCamerasAvailable
        }
        
    }
    
    func configureVideoOutput() throws {
        
        guard let captureSession = self.captureSession else {
            throw CameraControllerError.captureSessionIsMissing
        }
        
        self.videoOutput = AVCaptureVideoDataOutput()
        self.videoOutput!.setSampleBufferDelegate(self, queue: videoOutputQueue)
        
        if captureSession.canAddOutput(self.videoOutput!) {
            captureSession.addOutput(self.videoOutput!)
        }
        captureSession.startRunning()
    }

    // MARK: - Switch Cameras
    
    func switchCameras() throws {
        
        guard let currentCameraPosition = currentCameraPosition, let captureSession = self.captureSession, captureSession.isRunning else {
            throw CameraControllerError.captureSessionIsMissing
        }
        
        captureSession.beginConfiguration()
        
        func switchToFrontCamera() throws {
            let inputs = captureSession.inputs
            
            guard let rearCameraInput = self.cameraInput, inputs.contains(rearCameraInput), let frontCamera = self.frontCamera else {
                throw CameraControllerError.invalidOperation
            }
            
            self.cameraInput = try AVCaptureDeviceInput(device: frontCamera)
            
            captureSession.removeInput(rearCameraInput)
            
            if captureSession.canAddInput(self.cameraInput!) {
                captureSession.addInput(self.cameraInput!)
                
                self.currentCameraPosition = .front
            } else {
                throw CameraControllerError.invalidOperation
            }
            
        }
        func switchToRearCamera() throws {
            let inputs = captureSession.inputs
            
            guard let frontCameraInput = self.cameraInput, inputs.contains(frontCameraInput),
                let rearCamera = self.rearCamera else { throw CameraControllerError.invalidOperation }
         
            self.cameraInput = try AVCaptureDeviceInput(device: rearCamera)
         
            captureSession.removeInput(frontCameraInput)
         
            if captureSession.canAddInput(self.cameraInput!) {
                captureSession.addInput(self.cameraInput!)
         
                self.currentCameraPosition = .rear
            }
         
            else { throw CameraControllerError.invalidOperation }
        }
        
        switch currentCameraPosition {
        
        case .front:
            try switchToRearCamera()
        case .rear:
            try switchToFrontCamera()
        }
        
        captureSession.commitConfiguration()
    }
    
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
extension CameraController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        let timestamp = CMSampleBufferGetPresentationTimeStamp(sampleBuffer).seconds
        
        switch state {
        case .start:
            // Set up recorder
            fileName = UUID().uuidString

            guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(fileName).mov") else {
                return
            }

            let writer = try! AVAssetWriter(outputURL: url, fileType: .mov)
            let settings = videoOutput?.recommendedVideoSettingsForAssetWriter(writingTo: .mov)
            let input = AVAssetWriterInput(mediaType: .video, outputSettings: settings)
            input.mediaTimeScale = CMTimeScale(bitPattern: 600)
            input.expectsMediaDataInRealTime = true
            let adapter = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: input, sourcePixelBufferAttributes: nil)
            
            if writer.canAdd(input) {
                writer.add(input)
            }
            
            writer.startWriting()
            writer.startSession(atSourceTime: .zero)
            
            assetWriter = writer
            assetWriterInput = input
            assetWriterAdapter = adapter
            state = .capturing
            time = timestamp
            fallthrough
            
        case .capturing:
            if assetWriterInput?.isReadyForMoreMediaData == true {
                let presentationTime = CMTime(seconds: timestamp - time, preferredTimescale: CMTimeScale(600))
                assetWriterAdapter?.append(CMSampleBufferGetImageBuffer(sampleBuffer)!, withPresentationTime: presentationTime)
            }
            break
            
        case .end:
            guard assetWriterInput?.isReadyForMoreMediaData == true, assetWriter?.status != .failed else {
                break
            }
            guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(fileName).mov") else {
                return
            }
            
            assetWriterInput?.markAsFinished()
            assetWriter?.finishWriting { [weak self] in
                self?.state = .idle
                self?.assetWriter = nil
                self?.assetWriterInput = nil
                
                PHPhotoLibrary.shared().performChanges {
                    let request = PHAssetCreationRequest.forAsset()
                    request.addResource(with: .video, fileURL: url, options: nil)
                } completionHandler: { (success, error) in
                    print(error ?? "Error")
                }
            }
            
        default:
            break
        }
    }
}
