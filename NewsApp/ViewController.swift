//
//  ViewController.swift
//  NewsApp
//
//  Created by McKenzie Macdonald on 2/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    
    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set viewController as delegate and dataSource for tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // Get articles from article model
        model.delegate = self
        model.getArticles()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the index path of the row the user clicked on
        let indexPath = tableView.indexPathForSelectedRow
        guard indexPath != nil else {
            return
        }
        
        // Get the article the user selected
        let articleChosen = articles[indexPath!.row]
        
        // Get a reference to the detailViewController
        let detailVC = segue.destination as! DetailViewController
        
        // Pass the article to the detail view controller
        if let url = articleChosen.url {
            detailVC.articleURL = url
        }
        
    }


    
}

// MARK: - Article Model Delegate Methods
extension ViewController: ArticleModelProtocol {
    
    func articlesRetrieved(_ articles: [Article]) {
        
        self.articles = articles
        
        // Refresh table view to show new data
        tableView.reloadData()
        
    }
    
}

// MARK: - UITableView Delegate Methods
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Handle user interaction
        // Go to detail view
        performSegue(withIdentifier: "goToDetailView", sender: self)
    }
    
}

// MARK: - UITableView DataSource Methods
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequeue a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        // Get the article the table view is asking about
        let articleToDisplay = articles[indexPath.row]
        
        // Customize cell
        cell.displayArticle(articleToDisplay)
        
        // Return the cell
        return cell
        
    }
    
}
