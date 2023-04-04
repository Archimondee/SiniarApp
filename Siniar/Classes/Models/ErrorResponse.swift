//
//  ErrorResponse.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 03/04/23.
//

import Foundation

struct ErrorResponse: Decodable {
  let errorMessage: String

  enum CodingKeys: String, CodingKey {
    case errorMessage
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage) ?? ""
  }
}
