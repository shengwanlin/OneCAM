//
//  CaptureButton.swift
//  OneCAM
//
//  Created by sunvlink on 2017/5/26.
//  Copyright © 2017年 sunvlink. All rights reserved.
//

import UIKit

class CaptureButton: UIButton {
  
  private let circleLayer: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.backgroundColor = Specs.color.tint.cgColor
    return layer
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = UIColor.clear
    layer.addSublayer(circleLayer)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.cornerRadius = heigth / 2
    layer.masksToBounds = true
    layer.borderColor = Specs.color.tint.cgColor
    layer.borderWidth = 0.5
    
    let radius: CGFloat = 10.0
    let circleSize = CGSize(width: size.width - radius, height: size.height - radius)
    let circlePoint = CGPoint(x: radius / 2, y: radius / 2)
    circleLayer.frame = CGRect(origin:circlePoint, size: circleSize)
    circleLayer.cornerRadius = circleSize.height / 2
    circleLayer.masksToBounds = true
  }

}
