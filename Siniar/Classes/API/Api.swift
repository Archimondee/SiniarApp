//
//  Api.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 02/04/23.
//

import Foundation
import Moya

let api: MoyaProvider<Api> = .init(
  plugins: [
    NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
  ]
)

enum Api {
  case search(term: String, media: String, limit: Int)
}

extension Api: TargetType {
  var baseURL: URL {
    return URL(string: "https://itunes.apple.com")!
  }

  var path: String {
    switch self {
    case .search:
      return "/search"
    }
  }

  var method: Moya.Method {
    switch self {
    case .search:
      return .get
    }
  }

  var task: Moya.Task {
    switch self {
    case .search(let term, let media, let limit):
      let parameters: [String: Any] = [
        "term": term,
        "media": media,
        "limit": limit
      ]

      return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
  }

  var headers: [String: String]? {
    return nil
  }
}
