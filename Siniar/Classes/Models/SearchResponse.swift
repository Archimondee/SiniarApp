//
//  SearchResponse.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 02/04/23.
//

import Foundation

struct SearchResponse: Decodable {
  let resultCount: Int
  let results: [Podcast]

  enum CodingKeys: String, CodingKey {
    case resultCount
    case results
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount) ?? 0
    results = try values.decodeIfPresent([Podcast].self, forKey: .results) ?? []
  }
}
