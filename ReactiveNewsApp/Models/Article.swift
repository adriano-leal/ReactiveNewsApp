//
//  Article.swift
//  ReactiveNewsApp
//
//  Created by Adriano Ramos on 24/06/20.
//  Copyright © 2020 Adriano Ramos. All rights reserved.
//
import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

extension ArticleList {
    static var all: Resource<ArticleList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=753d2ced1d4840c9b044c2c7b4b892fd")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String
}
