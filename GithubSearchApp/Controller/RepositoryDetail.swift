//
//  RepositoryDetail.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 29.11.2021.
//

import UIKit

class RepositoryDetail: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var forksCount: UILabel!
    
    @IBOutlet weak var watchersCountLabel: UILabel!
    
    var seleceted : Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        backButtonAdded()
        putData()
    }
    fileprivate func backButtonAdded() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
    }
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    func putData(){
        repoNameLabel.text = seleceted?.name
        ownerNameLabel.text = seleceted?.owner.login
//        ownerAvatar = seleceted?.owner.avatarURL
        language.text = seleceted?.language as? String
//        forksCount.text = seleceted?.forksCount
//        watchersCount.text = seleceted?.watchersCount
        
    }
}
