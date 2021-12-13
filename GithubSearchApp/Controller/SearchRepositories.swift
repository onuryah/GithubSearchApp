//
//  ViewController.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 29.11.2021.
//

import UIKit

class SearchRepositories: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var repositoriesTableView: UITableView!

    var array = [Item]()
    var shownArray = [Item]()
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarAdded()
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

    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repositoriesTableView.dequeueReusableCell(withIdentifier: "foundRepositoriesCell", for: indexPath) as! FoundRepositoriesCell
        cell.ownerUsernameLabelField.text = array[indexPath.row].owner.login
        cell.peginateLabelField.text = String(indexPath.row + 1)
        cell.repositoryNameLabelField.text = array[indexPath.row].name
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toRepositoryDetailVC", sender: nil)
    }
    

}

extension SearchRepositories : FoundRepositoriesCellDelegate, UISearchResultsUpdating{
    fileprivate func registerCellToTableView(){
        let cellNib = UINib(nibName: "FoundRepositoriesCell", bundle: nil)
        repositoriesTableView.register(cellNib, forCellReuseIdentifier: "foundRepositoriesCell")
    }
    fileprivate func setDelegates(){
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
    }
    func didTapButton() {
        performSegue(withIdentifier: "toRepositoryDetailVC", sender: nil)
    }
    fileprivate func searchBarAdded(){
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        for data in array{
            if data.name.uppercased() == text.uppercased(){
                self.shownArray.append(data)
    }
}
}
}

