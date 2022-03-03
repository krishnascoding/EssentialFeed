//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Krishna Ramachandran on 2/17/22.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

extension LoadFeedResult: Equatable where Error: Equatable {}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
