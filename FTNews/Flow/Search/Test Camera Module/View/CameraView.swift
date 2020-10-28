//
//  CameraView.swift
//  FTNews
//
//  Created by Andrey Leganov on 20.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIView {
    
    // MARK: - View
    
    let previewView: CameraPreviewView = {
        let view = CameraPreviewView()
        
        return view
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "camera_close_button"), for: .normal)
        
        return button
    }()
    
    private let buttonsContainerView: UIView = UIView()
    
    let flashButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "camera_flash_off_icon"), for: .normal)
        
        return button
    }()
    
    let returnCameraButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "camera_return_icon"), for: .normal)
        
        return button
    }()
    
    let speedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "camera_speed_icon"), for: .normal)
        
        return button
    }()
    
    let captureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "camera_capture_button"), for: .normal)
        
        return button
    }()
    
    let captureButtonView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "camera_capture_button")
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(previewView)
        addSubview(closeButton)
        addSubview(buttonsContainerView)
        buttonsContainerView.addSubview(flashButton)
        buttonsContainerView.addSubview(returnCameraButton)
        buttonsContainerView.addSubview(speedButton)
        addSubview(captureButtonView)
        
        updateConstraintsIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        previewView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        closeButton.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(20.0)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50.0)
        }
        
        buttonsContainerView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview().inset(29.5)
            make.trailing.equalToSuperview().inset(9.0)
        }
        
        flashButton.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        returnCameraButton.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(flashButton.snp.bottom).offset(40.0)
            make.trailing.equalToSuperview()
        }
        
        speedButton.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(returnCameraButton.snp.bottom).offset(40.0)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        captureButtonView.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(60.0)
        }
    }
    
}
