//
//  ArticleModel.swift
//  NewsApp
//
//  Created by McKenzie Macdonald on 2/2/22.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article])
}

class ArticleModel {
    
    var delegate: ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire the request to API
        
        // Create a string URL
        let stringURL = "https://newsapi.org/v2/everything?q=apple&sortBy=popularity&apiKey=\(Constants.apiKey)"
            
        // Create URL object
        let url =  URL(string: stringURL)
            
        // Check that URL was created
        guard url != nil else {
            print("Could not create URL")
            return
        }
            
        // Get the URL session
        let session = URLSession.shared
            
        // Create a data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                // Parse the returned JSON into article instances
                
                let decoder = JSONDecoder()
                do {
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    if let articles = articleService.articles {
                        // Pass it back to the viewController in a main thread
                        DispatchQueue.main.async {
                            self.delegate?.articlesRetrieved(articles)
                        }
                    }

                } catch {
                    print("Could not decode the json data")
                }
            }
            else {
                print("Error creating dataTask")
            }
        }
            
        // Start the data task
        dataTask.resume()
    }
}
