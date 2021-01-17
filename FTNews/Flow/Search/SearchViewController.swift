//
//  SearchViewController.swift
//  FTNews
//
//  Created by Andrey Leganov on 30.09.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit
import Photos

class SearchViewController: UIViewController {
    
//    var cameraController = CameraController()
//
//    var mainView: CameraView! {
//        return view as? CameraView
//    }

//    override var prefersStatusBarHidden: Bool {
//        return true
//    }

//    override func loadView() {
//        view = CameraView()
//    }
    
    override func viewDidLoad() {
        
//        configureCameraController()
//
//        mainView.flashButton.addTarget(self, action: #selector(toggleFlash), for: .touchUpInside)
//        mainView.returnCameraButton.addTarget(self, action: #selector(switchCameras), for: .touchUpInside)
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(recordVideo))
//        mainView.captureButtonView.addGestureRecognizer(tapGestureRecognizer)
        
        self.view.backgroundColor = UIColor(hex6: 0xFFF1E4)
        let label = UILabel(frame: CGRect.zero)
        label.text = "Search View Controller"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.sizeToFit()
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
//    func configureCameraController() {
//        cameraController.prepare { error in
//            if let error = error {
//                print(error)
//            }
//            self.mainView.previewView.session = self.cameraController.captureSession
//        }
//    }

//    @objc private func toggleFlash(_ sender: UIButton) {
//        if cameraController.flashMode == .on {
//            cameraController.flashMode = .off
//            mainView.flashButton.setImage(#imageLiteral(resourceName: "camera_flash_off_icon"), for: .normal)
//        } else {
//            cameraController.flashMode = .on
//            mainView.flashButton.setImage(#imageLiteral(resourceName: "camera_flash_on_icon"), for: .normal)
//        }
//    }
//
//    @objc private func switchCameras(_ sender: UIButton) {
//        do {
//            try cameraController.switchCameras()
//        } catch {
//            print(error)
//        }
//    }
//
//    @objc private func recordVideo(_ sender: UITapGestureRecognizer) {
//
//        switch cameraController.state {
//        case .idle:
//            cameraController.state = .start
//        case .capturing:
//            cameraController.state = .end
//        default:
//            break
//        }
//    }
    
}
