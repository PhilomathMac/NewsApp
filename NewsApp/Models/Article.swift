//
//  Article.swift
//  NewsApp
//
//  Created by McKenzie Macdonald on 2/2/22.
//

import Foundation

struct Article: Decodable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
}
