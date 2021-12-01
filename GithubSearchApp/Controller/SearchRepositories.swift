//
//  ViewController.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 29.11.2021.
//

import UIKit

class SearchRepositories: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var repositoriesTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    var array = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        registerCellToTableView()
        getData()
    }
    func getData() {
        URLSession.shared.dataTask(with: SearchRepositoriesUrl().searchRepositoriesUrl!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "ERROR", message: "Error!", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else if data != nil {
                guard let data = data else {return}
                do{
                    
                    let jsonData = try JSONDecoder().decode(Welcome.self, from: data)
                    self.array = jsonData.items
                    print(self.array)
                    

                        DispatchQueue.main.async {
                            self.repositoriesTableView.reloadData()
                        }
                }catch{
                    
                }
            }
        }.resume()
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        repositoriesTableView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repositoriesTableView.dequeueReusableCell(withIdentifier: "foundRepositoriesCell", for: indexPath) as! FoundRepositoriesCell
        cell.ownerUsernameLabelField.text = array[indexPath.row].owner.login
        cell.peginateLabelField.text = String(indexPath.row + 1)
        cell.repositoryNameLabelField.text = array[indexPath.row].name
        return cell
    }
    

}

extension SearchRepositories{
    fileprivate func registerCellToTableView(){
        let cellNib = UINib(nibName: "FoundRepositoriesCell", bundle: nil)
        repositoriesTableView.register(cellNib, forCellReuseIdentifier: "foundRepositoriesCell")
    }
    fileprivate func setDelegates(){
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
    }
}

