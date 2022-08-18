//
//  ArticleService.swift
//  NewsApp
//
//  Created by McKenzie Macdonald on 2/2/22.
//

import Foundation

struct ArticleService: Decodable {
    
    var totalResults: Int?
    var articles: [Article]?
    
}
