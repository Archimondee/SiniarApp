//
//  SmallPrimaryButton.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 31/03/23.
//

import UIKit

class SmallPrimaryButton: PrimaryButton {
  override func setup() {
    super.setup()

    titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
  }
}
