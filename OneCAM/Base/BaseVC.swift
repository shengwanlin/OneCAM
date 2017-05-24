//
//  BaseVC.swift
//  OneCAM
//
//  Created by sunvlink on 2017/5/24.
//  Copyright © 2017年 sunvlink. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Specs.color.white
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
}
