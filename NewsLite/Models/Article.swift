//
//  Article.swift
//  NewsLite
//
//  Created by Shinto Joseph on 10/04/21.
//

import Foundation

struct ArticleList:Decodable{
    let articles:[Article]
}

struct Article:Decodable{
    let title:String?
    let description:String?
}

