//
//  UserDetail.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 29.11.2021.
//

import UIKit

class UserDetail: UIViewController {
    var selected: Item?
    @IBOutlet weak var userTableView: UITableView!
    var repositories = [WelcomeElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButtonAdded()
    }
    
    fileprivate func backButtonAdded() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
    }
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "repositoriesOfUserCell", for: indexPath) as! RepositoriesOfUserCell
        return cell
    }

}
extension UserDetail: UITableViewDelegate, UITableViewDataSource{

    fileprivate func registerCellToTableView(){
        let cellNib = UINib(nibName: "RepositoriesOfUserCell", bundle: nil)
        userTableView.register(cellNib, forCellReuseIdentifier: "repositoriesOfUserCell")
    }
    
    func getData() {
        guard let url = URL(string: SearchRepositoriesUrl.baseUrl+SearchRepositoriesUrl.repoName+SearchRepositoriesUrl.between+SearchRepositoriesUrl.pageNumber)  else {return}
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
            }else if data != nil {
                guard let data = data else {return}
                do{
                    
                    let jsonData = try JSONDecoder().decode(RepositoriesArray.self, from: data)
                    self.repositories = jsonData
                    

                        DispatchQueue.main.async {
                            self.userTableView.reloadData()
                        }
                }catch{}
            }
        }.resume()
        
    }

    
}
