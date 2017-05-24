//
//  Specs.swift
//  OneCAM
//
//  Created by sunvlink on 2017/5/24.
//  Copyright © 2017年 sunvlink. All rights reserved.
//

import UIKit

public struct Specs {
  
  // MARK: - Color
  public struct Color {
    public let tint = UIColor(hex: 0x28C196)
    public let red = UIColor(hex: 0xea545d)
    public let white = UIColor.white
    public let black = UIColor.black
    public let gray = UIColor.gray
    public let lightGray = UIColor(hex: 0xe0e0e0)
    public let blueGray = UIColor(hex: 0x607d8b)
    public let separator = UIColor(hex: 0x546e7a)
  }
  public static let color = Color()
  
  // MARK: - Font size
  public struct FontSize {
    public let tiny: CGFloat = 10
    public let small: CGFloat = 12
    public let regular: CGFloat = 14
    public let large: CGFloat = 16
  }
  public static let fontSize = FontSize()
  
  // MARK: - Font
  public struct Font {
    public let tiny = UIFont.systemFont(ofSize: Specs.fontSize.tiny)
    public let small = UIFont.systemFont(ofSize: Specs.fontSize.small)
    public let regular = UIFont.systemFont(ofSize: Specs.fontSize.regular)
    public let large = UIFont.systemFont(ofSize: Specs.fontSize.large)
    public let smallBold = UIFont.boldSystemFont(ofSize: Specs.fontSize.small)
    public let regularBold = UIFont.boldSystemFont(ofSize: Specs.fontSize.regular)
    public let largeBold = UIFont.boldSystemFont(ofSize: Specs.fontSize.large)
  }
  public static let font = Font()
}
