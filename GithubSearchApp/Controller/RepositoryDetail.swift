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
        let selectedData = Singleton.chosenItem
        if let imageUrl = selectedData?.owner.avatarURL{
            avatarImageView.sd_setImage(with: URL(string: imageUrl))
        }
        
        if let selectedData = selectedData {
            repoNameLabel.text = "Repository Name: "+selectedData.name
            ownerNameLabel.text = "Owner Name: "+selectedData.owner.login
            forksCount.text = "Forks Count: "+String(selectedData.forksCount)
            watchersCountLabel.text = "Watchers Count:"+String(selectedData.watchersCount)
            if selectedData.language != nil{
                language.text = "Language: "+selectedData.language!.rawValue
            }else{
                language.text = "Language: Not Found"
            }
        }
        
    }
}
