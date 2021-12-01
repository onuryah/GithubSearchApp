//
//  SearchRepositoriesUrl.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 30.11.2021.
//

import Foundation

struct SearchRepositoriesUrl{
    let searchRepositoriesUrl = URL(string: "https://api.github.com/search/repositories?q=retrofit&per_page=100&page=1")
}
