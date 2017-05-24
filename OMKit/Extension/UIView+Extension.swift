//
//  UIView+Extension.swift
//  OneCAM
//
//  Created by sunvlink on 2017/5/24.
//  Copyright © 2017年 sunvlink. All rights reserved.
//

import UIKit

public extension UIView {
  
  var width: CGFloat {
    return frame.width
  }
  
  var heigth: CGFloat {
    return frame.height
  }
  
  var left: CGFloat {
    return frame.minX
  }
  
  var top: CGFloat {
    return frame.minY
  }
  
  var right: CGFloat {
    return frame.maxX
  }
  
  var bottom: CGFloat {
    return frame.maxY
  }
		
  var size: CGSize {
    return frame.size
  }
  
  var centerY: CGFloat {
    return center.y
  }
  
  var centerX: CGFloat {
    return center.x
  }
  
  func clipsToBoundsAndRasterize() {
    clipsToBounds = true
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }
  
}

public extension CALayer {
  
  var width: CGFloat {
    return frame.width
  }
  
  var heigth: CGFloat {
    return frame.height
  }
  
  var left: CGFloat {
    return frame.minX
  }
  
  var top: CGFloat {
    return frame.minY
  }
  
  var right: CGFloat {
    return frame.maxX
  }
  
  var bottom: CGFloat {
    return frame.maxY
  }
		
  var size: CGSize {
    return frame.size
  }
  
  var centerY: CGFloat {
    return frame.minY + frame.height / 2
  }
  
  var centerX: CGFloat {
    return frame.minX + frame.width / 2
  }

}
