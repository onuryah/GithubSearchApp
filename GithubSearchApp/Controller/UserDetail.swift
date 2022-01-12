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
    var userInfos = [WelcomeElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButtonAdded()
        registerCellToTableView()
        getData()
    }
    
    fileprivate func backButtonAdded() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
    }
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfos.count
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
            
        
        
        guard let url = URL(string: "https://api.github.com/users/JakeWharton")  else {return}
            URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
            }else if data != nil {
                guard let data = data else {return}
                do{
                    let jsonData: [WelcomeElement] = try JSONDecoder().decode([WelcomeElement].self, from: data)
                    print("kontrol2: \(jsonData)")
                    
                    

                        DispatchQueue.main.async {
                            self.userTableView.reloadData()
                        }
                }catch{}
            }
        }.resume()
        
    
    }

    
}
