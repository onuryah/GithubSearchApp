//
//  SearchRepositoriesUrl.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 30.11.2021.
//

import Foundation

struct SearchRepositoriesUrl{
    static let baseUrl = "https://api.github.com/search/repositories?q="
    static var repoName = "retrofit"
    static let between = "&per_page=100&page="
    static let pageNumber = ["1","2","3","4","5","6","7","8","9","10"]
    static var url = baseUrl+repoName+between
}
