//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Krishna Ramachandran on 3/2/22.
//

import Foundation

// internal is default, but explicitly declaring it anyway
internal final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
    }

    private struct Item: Decodable {
        public let id: UUID
        public let description: String?
        public let location: String?
        public let image: URL
        
        var item: FeedItem {
            return FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }
    
    private static var OK_200: Int { 200 }

    internal static func map(_ data: Data, response: HTTPURLResponse) throws -> [FeedItem] {
        guard response.statusCode == OK_200 else {
            throw RemoteFeedLoader.Error.invalidData
        }
        let root = try JSONDecoder()
            .decode(Root.self, from: data)
        return root.items.map { $0.item}
    }
}
