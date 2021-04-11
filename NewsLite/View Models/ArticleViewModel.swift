//
//  ArticleViewModel.swift
//  NewsLite
//
//  Created by Shinto Joseph on 11/04/21.
//

import Foundation

struct ArticleListViewModel{
    
    let articles:[Article]
}

extension ArticleListViewModel{
    
    var numberOfSections:Int{
        return 1;
    }
    
    func noOfRowsInSection(_ section:Int) -> Int{
        return articles.self.count
    }
    
    func articleAtIndex(_ index:Int) -> ArticleViewModel{
        
        let article = self.articles[index]
        return ArticleViewModel(article)
        
    }
}

struct ArticleViewModel {
    
    private let article:Article
}

extension ArticleViewModel{
    
    init(_ article:Article){
        self.article = article
    }
}

extension ArticleViewModel{
    
    var title:String{
        
        return self.article.title ?? "Title Missing"
    }
    var description:String{
        
        return self.article.description ?? "Description Missing"
    }
}
