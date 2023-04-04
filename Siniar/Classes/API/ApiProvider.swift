//
//  ApiProvider.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 02/04/23.
//

import FeedKit
import Foundation
import RxSwift

class ApiProvider {
  static var shared: ApiProvider = .init()

  private init() {}

  private let disposeBag = DisposeBag()

  func search(_ term: String, media: String = "podcast", limit: Int = 20,
              completion: @escaping (Result<[Podcast], Error>) -> Void)
  {
    api.rx.request(.search(term: term, media: media, limit: limit))
      .validate()
      .map(SearchResponse.self)
      .subscribe { response in
        switch response {
        case .success(let response):
          completion(.success(response.results))
        case .failure(let error):
          completion(.failure(error))
        }
      }.disposed(by: disposeBag)
  }

  func loadFromFeedUrl(_ url: String, completion: @escaping (Result<RSSFeed?, Error>) -> Void) {
    if let feedUrl = URL(string: url) {
      let parser = FeedParser(URL: feedUrl)
      parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { result in
        DispatchQueue.main.async {
          switch result {
          case .success(let feed):
            completion(.success(feed.rssFeed))
          case .failure(let error):
            completion(.failure(error))
          }
        }
      }
    } else {
      let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Oops! Something went wrong"])
      completion(.failure(error))
    }
  }
}
