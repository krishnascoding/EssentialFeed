//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Krishna Ramachandran on 2/18/22.
//

import XCTest

class RemoteFeedLoader { }

class HTTPClient {
    var requestedURL: URL?
}
class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let _ = RemoteFeedLoader()
        let client = HTTPClient()
        
        XCTAssertNil(client.requestedURL)
    }

}
