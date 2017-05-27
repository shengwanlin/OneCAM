//
//  CameraViewController.swift
//  OneCAM
//
//  Created by sunvlink on 2017/5/24.
//  Copyright © 2017年 sunvlink. All rights reserved.
//

import UIKit
import GPUImage

class CameraViewController: BaseVC {
  
  @IBOutlet weak var renderView: GPUImageView!
  @IBOutlet weak var captureButton: CaptureButton!
  
  var stillCamera: GPUImageStillCamera!
  var saturation: GPUImageSaturationFilter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupCamera()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    captureButton.setNeedsLayout()
  }
  
  func setupUI() {
    let focusTap = UITapGestureRecognizer(target: self, action: #selector(onTappedRenderView(tapGestureRecognizer:)))
    focusTap.numberOfTapsRequired = 1
    renderView.addGestureRecognizer(focusTap)
  }
  
  func setupCamera() {
    saturation = GPUImageSaturationFilter()
    saturation.addTarget(renderView)
    saturation.saturation = 0.5;
    
    stillCamera = GPUImageStillCamera(sessionPreset: AVCaptureSessionPresetPhoto, cameraPosition: .back)
    stillCamera.outputImageOrientation = preferredInterfaceOrientationForPresentation;
    stillCamera.addTarget(saturation)
    stillCamera.startCapture()
  }
  
  // MARK: Actions
  
  @IBAction func captureStillImage(_ sender: UIButton) {
    stillCamera.capturePhotoAsImageProcessedUp(toFilter: saturation) { (image, error) in
      
    }
  }
  @IBAction func switchCameraDevice(_ sender: UIButton) {
    stillCamera.rotateCamera()
    print(stillCamera.cameraPosition().rawValue)
  }
  
  // MARK: GestureRecognizer
  
  func onTappedRenderView(tapGestureRecognizer : UITapGestureRecognizer) {
    let pointInPreview = tapGestureRecognizer.location(in: tapGestureRecognizer.view)
    let pointInCamera = CGPoint(x: pointInPreview.y / renderView.heigth, y: 1.0 - (pointInPreview.x / renderView.width))

    stillCamera.inputCamera.focus(interestPoint: pointInCamera)
    stillCamera.inputCamera.expose(interestPoint: pointInCamera)
    
    let view = UIView(frame: CGRect(origin: pointInPreview, size: CGSize(width: 1, height: 1)))
    view.backgroundColor = Specs.color.red
    tapGestureRecognizer.view?.addSubview(view)
  }

}
