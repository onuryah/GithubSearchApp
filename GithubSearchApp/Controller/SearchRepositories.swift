//
//  ViewController.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 29.11.2021.
//

import UIKit
import SDWebImage

class SearchRepositories: UIViewController {
    
    
    @IBOutlet weak var repositoriesTableView: UITableView!

    var array = [Item]()
    let searchController = UISearchController()
    var chosen : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarAdded()
        setDelegates()
        registerCellToTableView()
        getData()
    }

    func getData() {
        guard let url = URL(string: SearchRepositoriesUrl.baseUrl+SearchRepositoriesUrl.repoName+SearchRepositoriesUrl.between+SearchRepositoriesUrl.pageNumber)  else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
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
                    

                        DispatchQueue.main.async {
                            self.repositoriesTableView.reloadData()
                        }
                }catch{}
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
        cell.ownerImageView.sd_setImage(with: URL(string: array[indexPath.row].owner.avatarURL))
        cell.segueButton.tag = indexPath.row
        cell.segueButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Singleton.chosenItem = array[indexPath.row]
        performSegue(withIdentifier: "toRepositoryDetailVC", sender: nil)
    }
    

}

extension SearchRepositories: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{
    fileprivate func registerCellToTableView(){
        let cellNib = UINib(nibName: "FoundRepositoriesCell", bundle: nil)
        repositoriesTableView.register(cellNib, forCellReuseIdentifier: "foundRepositoriesCell")
    }
    fileprivate func setDelegates(){
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
    }
    func didTapButton() {
        performSegue(withIdentifier: "toUserDetailVC", sender: nil)
    }
    fileprivate func searchBarAdded(){
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        if text != "" {
            SearchRepositoriesUrl.repoName = text
            getData()
        }else{
            getData()
        }
        
    }
    
    @objc func tapped(sender: UIButton){
        let indexpath = IndexPath(row: sender.tag, section: 0)
        Singleton.chosenItem = array[indexpath.row]
        Singleton.chosenUser = array[indexpath.row].owner.login
        performSegue(withIdentifier: "toUserDetailVC", sender: nil)
    }

    
}

