//
//  ViewController.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 29.11.2021.
//

import UIKit

class SearchRepositories: UIViewController {
    @IBOutlet weak var repositoriesTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func searchButtonClicked(_ sender: Any) {
        repositoriesTableView.isHidden = false
    }
    

}

