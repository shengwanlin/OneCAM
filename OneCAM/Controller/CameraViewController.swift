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
  
  var stillCamera: GPUImageStillCamera?
  
  var filter: GPUImageSketchFilter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    filter = GPUImageSketchFilter()
    filter.addTarget(renderView)
    
    restartCamera(with: .back)
  }
  
//  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//    
//  }
  
  // MARK: Actions
  
  @IBAction func captureStillImage(_ sender: UIButton) {
    stillCamera?.capturePhotoAsImageProcessedUp(toFilter: filter) { (image, error) in
      
    }
//    stillCamera.capturePhotoAsImageProcessedUp(toFilter: <#T##GPUImageOutput!#>, withCompletionHandler: <#T##((UIImage?, Error?) -> Void)!##((UIImage?, Error?) -> Void)!##(UIImage?, Error?) -> Void#>)
//    [stillCamera capturePhotoProcessedUpToFilter:filter withCompletionHandler:^(UIImage *processedImage, NSError *error){
//      NSData *dataForJPEGFile = UIImageJPEGRepresentation(processedImage, 0.8);
//      
//      NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//      NSString *documentsDirectory = [paths objectAtIndex:0];
//      
//      NSError *error2 = nil;
//      if (![dataForJPEGFile writeToFile:[documentsDirectory stringByAppendingPathComponent:@"FilteredPhoto.jpg"] options:NSAtomicWrite error:&error2])
//      {
//      return;
//      }
//      }];
    
  }
  @IBAction func switchCameraDevice(_ sender: UIButton) {
    restartCamera(with: stillCamera?.cameraPosition() == .front ? .back : .front)
  }
  
  func restartCamera(with position: AVCaptureDevicePosition) {
    if let camera = self.stillCamera {
      camera.stopCapture()
      camera.removeAllTargets()
    }
    let stillCamera = GPUImageStillCamera(sessionPreset: AVCaptureSessionPresetPhoto, cameraPosition: position)
    stillCamera?.outputImageOrientation = preferredInterfaceOrientationForPresentation;
    
    self.stillCamera = stillCamera;
    self.stillCamera?.addTarget(filter)
    self.stillCamera?.startCapture()
  }
  
  
}
