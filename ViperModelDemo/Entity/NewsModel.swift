//
//  NewsModel.swift
//  ViperModelDemo
//
//  Created by Vaishak Iyer on 21/06/19.
//  Copyright © 2019 Vaishak Iyer. All rights reserved.
//

import Foundation

struct NewsModel: Codable {
    let status, source, sortBy: String
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author, title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    
    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt
    }
}
