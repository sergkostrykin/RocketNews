//
//  BlogsNetworkingServiceTests.swift
//  RocketNewsTests
//
//  Created by Sergiy Kostrykin on 21/08/2022.
//

import Foundation
import XCTest

@testable import RocketNews

class BlogsNetworkingServiceTests: XCTestCase {
    
    func testBlogsRequest() {
        let expectation = self.expectation(description: "Blogs expectation")
        BlogNetworkingService.blogs { result, error in
            if error != nil {
                XCTFail()
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10)
    }
    
    func testBlogRequest() {
        let expectation = self.expectation(description: "Blog expectation")
        BlogNetworkingService.blogs { result, error in
            if error != nil {
                XCTFail()
            }
            
            guard let id = (result?.first(where: { $0.id != nil }))?.id else {
                XCTFail()
                return
                
            }
            BlogNetworkingService.blog(id: id) { result, error in
                if error != nil {
                    XCTFail()
                }
                expectation.fulfill()
            }
            
        }
        self.waitForExpectations(timeout: 10)
    }

}
