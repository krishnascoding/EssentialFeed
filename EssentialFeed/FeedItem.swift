//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Krishna Ramachandran on 2/17/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
