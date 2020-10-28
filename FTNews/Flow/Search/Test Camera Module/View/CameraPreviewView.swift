//
//  CameraPreviewView.swift
//  FTNews
//
//  Created by Andrey Leganov on 28.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import AVFoundation
import UIKit

class CameraPreviewView: UIView {
    
    // MARK: - Vars
    
    public var videoPreviewLayer: AVCaptureVideoPreviewLayer! {
        return layer as? AVCaptureVideoPreviewLayer
    }
    
    public var session: AVCaptureSession? {
        get {
            return videoPreviewLayer.session
        }
        set {
            videoPreviewLayer.session = newValue
        }
    }
    
    // MARK: - Lifecycle
    
    public override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black

        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.connection?.videoOrientation = .portrait
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
