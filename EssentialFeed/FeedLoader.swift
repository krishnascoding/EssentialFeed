//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Krishna Ramachandran on 2/17/22.
//

import Foundation

public enum LoadFeedResult{
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
