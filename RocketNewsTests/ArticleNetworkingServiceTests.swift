//
//  ArticleNetworkingServiceTests.swift
//  RocketNewsTests
//
//  Created by Sergiy Kostrykin on 21/08/2022.
//

import Foundation
import XCTest

@testable import RocketNews

class ArticleNetworkingServiceTests: XCTestCase {
    
    func testArticlesRequest() {
        let expectation = self.expectation(description: "Articles expectation")
        ArticlesNetworkingService.articles { result, error in
            if error != nil {
                XCTFail()
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10)
    }
    
    func testArticleRequest() {
        let expectation = self.expectation(description: "Articles expectation")
        ArticlesNetworkingService.articles { result, error in
            if error != nil {
                XCTFail()
            }
            
            guard let id = (result?.first(where: { $0.id != nil }))?.id else {
                XCTFail()
                return
                
            }
            ArticlesNetworkingService.article(id: id) { result, error in
                if error != nil {
                    XCTFail()
                }
                expectation.fulfill()
            }
            
        }
        self.waitForExpectations(timeout: 10)
    }
    
    func testLaunchRequest() {
        let expectation = self.expectation(description: "Articles expectation")
        ArticlesNetworkingService.articles { result, error in
            if error != nil {
                XCTFail()
            }
            let article = result?.first(where: { !($0.launches?.isEmpty ?? true) })
            guard let launch = article?.launches?.first, let launchId = launch.id else {
                XCTFail()
                return
            }
            ArticlesNetworkingService.articleLaunch(id: launchId) { result, error in
                if error != nil {
                    XCTFail()
                }
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 10)
    }
    
    func testEventRequest() {
        let expectation = self.expectation(description: "Articles expectation")
        ArticlesNetworkingService.articles { result, error in
            if error != nil {
                XCTFail()
            }
            let article = result?.first(where: { !($0.events?.isEmpty ?? true) })
            guard let event = article?.events?.first, let eventId = event.id else {
                XCTFail()
                return
            }
            ArticlesNetworkingService.articleEvent(id: eventId) { result, error in
                if error != nil {
                    XCTFail()
                }
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 10)
    }
}
