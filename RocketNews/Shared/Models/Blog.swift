//
//  Blog.swift
//  RocketNews
//
//  Created by Sergiy Kostrykin on 21/08/2022.
//

import Foundation

struct Blog: Codable {
    let id: Int?
    let title: String?
    let url: String?
    let imageUrl: String?
    let newsSite: String?
    let summary: String?
    let publishedAt: String?
    let updatedAt: String?
    let launches: [Launch]?
    let events: [Event]?
}
