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
  @IBOutlet weak var captureButton: UIButton!
  
  fileprivate let captureLayer: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.colors = [Specs.color.tint.cgColor]
    layer.locations = [0, 0.5, 1]
    layer.startPoint = CGPoint(x: 0, y: 0.5)
    layer.endPoint = CGPoint(x: 1, y: 0.5)
    return layer
  }()
  
  var stillCamera: GPUImageStillCamera!
  var saturation: GPUImageSaturationFilter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    saturation = GPUImageSaturationFilter()
    saturation.addTarget(renderView)
    saturation.saturation = 0.5;
    
    restartCamera(with: .back)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    captureLayer.frame = captureButton.bounds
    captureLayer.cornerRadius = captureLayer.heigth / 2
    captureLayer.masksToBounds = true
    
  }
  
  func setupUI() {
    captureButton.setTitle("", for: .normal)
    captureButton.layer.addSublayer(captureLayer)
    
    let focusTap = UITapGestureRecognizer(target: self, action: #selector(onTappedRenderView(tapGestureRecognizer:)))
    focusTap.numberOfTapsRequired = 1
    renderView.addGestureRecognizer(focusTap)
  }

  func restartCamera(with position: AVCaptureDevicePosition) {
    if let camera = self.stillCamera {
      camera.stopCapture()
      camera.removeAllTargets()
    }
    let stillCamera = GPUImageStillCamera(sessionPreset: AVCaptureSessionPresetPhoto, cameraPosition: position)
    stillCamera?.outputImageOrientation = preferredInterfaceOrientationForPresentation;
    
    self.stillCamera = stillCamera;
    self.stillCamera?.addTarget(saturation)
    self.stillCamera?.startCapture()
  }
  
  // MARK: Actions
  
  @IBAction func captureStillImage(_ sender: UIButton) {
    stillCamera?.capturePhotoAsImageProcessedUp(toFilter: saturation) { (image, error) in
      
    }
    
  }
  @IBAction func switchCameraDevice(_ sender: UIButton) {
    restartCamera(with: stillCamera?.cameraPosition() == .front ? .back : .front)
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
