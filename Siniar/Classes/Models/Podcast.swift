//
//  Podcast.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 02/04/23.
//

import Foundation

struct Podcast: Decodable {
  let collectionId: Int
  let trackId: Int
  let artistName: String
  let collectionName: String
  let trackName: String
  let artworkUrl30: String
  let artworkUrl60: String
  let artworkUrl100: String
  let artworkUrl600: String
  let genres: [String]
  let feedUrl: String

  enum CodingKeys: String, CodingKey {
    case collectionId
    case trackId
    case artistName
    case collectionName
    case trackName
    case artworkUrl30
    case artworkUrl60
    case artworkUrl100
    case artworkUrl600
    case genres
    case feedUrl
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.collectionId = try container.decodeIfPresent(Int.self, forKey: .collectionId) ?? 0
    self.trackId = try container.decodeIfPresent(Int.self, forKey: .trackId) ?? 0
    self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName) ?? ""
    self.collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName) ?? ""
    self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? ""
    self.artworkUrl30 = try container.decodeIfPresent(String.self, forKey: .artworkUrl30) ?? ""
    self.artworkUrl60 = try container.decodeIfPresent(String.self, forKey: .artworkUrl60) ?? ""
    self.artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? ""
    self.artworkUrl600 = try container.decodeIfPresent(String.self, forKey: .artworkUrl600) ?? ""
    self.genres = try container.decodeIfPresent([String].self, forKey: .genres) ?? []
    self.feedUrl = try container.decodeIfPresent(String.self, forKey: .feedUrl) ?? ""
  }
}
