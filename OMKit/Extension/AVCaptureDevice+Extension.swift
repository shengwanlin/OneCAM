//
//  AVCaptureDevice+Extension.swift
//  OneCAM
//
//  Created by sunvlink on 2017/5/25.
//  Copyright © 2017年 sunvlink. All rights reserved.
//

import AVFoundation

public extension AVCaptureDevice {
  
  func focus(interestPoint: CGPoint) {
    do {
      try lockForConfiguration()
      if isFocusPointOfInterestSupported == true {
        focusPointOfInterest = interestPoint
      }
      if isFocusModeSupported(.autoFocus) == true {
        focusMode = .autoFocus
      }
      unlockForConfiguration()
    }
    catch {
      print("\(error)")
    }
  }
  
  func expose(interestPoint: CGPoint) {
    do {
      try lockForConfiguration()
      if isExposurePointOfInterestSupported == true {
        exposurePointOfInterest = interestPoint
      }
      if isExposureModeSupported(.autoExpose) == true {
        exposureMode = .autoExpose
      }
      unlockForConfiguration()
    }
    catch {
      print("\(error)")
    }
  }
}
