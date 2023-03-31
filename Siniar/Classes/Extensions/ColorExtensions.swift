//
//  ColorExtensions.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 31/03/23.
//

import Foundation
import UIKit

public extension UIColor {
  internal enum Siniar {
    static var brand1: UIColor = .init(rgb: 0xCBFB5E)
    static var brand2: UIColor = .init(rgb: 0x0E0B1F)
    static var neutral1: UIColor = .init(rgb: 0xEEEEEE)
    static var neutral2: UIColor = .init(rgb: 0x71737B)
    static var neutral3: UIColor = .init(rgb: 0x20242F)
  }

  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red number")
    assert(green >= 0 && green <= 255, "Invalid green number")
    assert(blue >= 0 && blue <= 255, "Invalid blue number")
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 110)
  }

  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: rgb >> 8 & 0xFF,
      blue: rgb & 0xFF
    )
  }
}
