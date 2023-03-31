//
//  PrimaryButton.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 31/03/23.
//

import UIKit

class PrimaryButton: UIButton {
  convenience init() {
    self.init(type: .system)
    setup()
  }

  func setup() {
    tintColor = UIColor.Siniar.neutral3
    backgroundColor = UIColor.Siniar.brand1
    titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    layer.cornerRadius = 4
    layer.masksToBounds = true
  }
}
