//
//  WebService.swift
//  NewsLite
//
//  Created by Shinto Joseph on 10/04/21.
//

import Foundation

class WebService{
    
//    Escaping Closure : An escaping closure is a closure that’s called after the function it was passed to returns. In other words, it outlives the function it was passed to.
//    Non-escaping closure : A closure that’s called within the function it was passed into, i.e. before it returns.
    
    func getArticles(url:URL,completion:@escaping ([Article]?) ->()){
        
        URLSession.shared.dataTask(with: url) { (data, response,error) in
            
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList{
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
