//
//  DateExtensions.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 05/04/23.
//

import Foundation

import Foundation

extension Date {
  func string(format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.string(from: self)
  }
}
