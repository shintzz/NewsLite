//
//  NewsListTableViewController.swift
//  NewsLite
//
//  Created by Shinto Joseph on 10/04/21.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        Util.shared.startLoading(view: self.view)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e4e9a66729f048b5a56cf87837a36d92")!
        WebService().getArticles(url: url) { articles in
            
            if let articles = articles{
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    Util.shared.stopLoading()
                    self.tableView.reloadData()
                }
            }
            else{
                
                DispatchQueue.main.async {
                    Util.shared.stopLoading()
                    let alert = UIAlertController.init(title: "OOPS...", message: "Unable to load data", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.articleListVM.noOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            fatalError("ArticleTableViewCellNotFound")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
   
}
