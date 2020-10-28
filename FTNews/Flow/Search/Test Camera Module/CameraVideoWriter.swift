//
//  CameraVideoWriter.swift
//  FTNews
//
//  Created by Andrey Leganov on 28.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import AVFoundation

enum VideoWriterState {
    case idle
    case start
    case capturing
    case end
}

class CameraVideoWriter {
    
    var assetWriter: AVAssetWriter?
    var assetWriterInput: AVAssetWriterInput?
    var assetWriterAdapter: AVAssetWriterInputPixelBufferAdaptor?
    var fileName: String = ""
    var time: Double = 0.0
    var state: VideoWriterState = .idle
    
}
