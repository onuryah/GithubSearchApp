//
//  FetchSearchRepositories.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 30.11.2021.
//

import Foundation
/*
class FetchSearchRepositories{
    private var albumArray = [Datas]()
    
    func getData(completion : @escaping([Datas]?) -> ()) {
        URLSession.shared.dataTask(with: SearchRepositoriesUrl().searchRepositoriesUrl!) { data, response, error in
            DispatchQueue.main.async {
                if error != nil{
                    completion(nil)
                }else {
                    do{
                        let jasonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                            if let itemsArray = jasonResponse["items"] as? [String : Any]{
                                if let repoId = itemsArray["id"] as? Int{
                                    if let repoName = itemsArray["name"] as? String{
                                        if let ownerArray = itemsArray["owner"] as? [String : Any]{
                                            if let username = ownerArray["login"] as? String{
                                                if let userId = ownerArray["id"] as? Int{
                                                    if let avatarUrl = ownerArray["avatar_url"] as? String{
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        
                    }catch{
                        print("error")
                    }
                }
            }
        }.resume()
    }
 }*/
