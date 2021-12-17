//
//  FoundRepositoriesCell.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 29.11.2021.
//

import UIKit


class FoundRepositoriesCell: UITableViewCell {
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerUsernameLabelField: UILabel!
    @IBOutlet weak var repositoryNameLabelField: UILabel!
    @IBOutlet weak var peginateLabelField: UILabel!
    @IBOutlet weak var segueButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fixLabelFields()
        addGestureRecognizer()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension FoundRepositoriesCell{
    private func fixLabelFields(){
        ownerUsernameLabelField.lineBreakMode = .byWordWrapping
        ownerUsernameLabelField.numberOfLines = 0
        repositoryNameLabelField.lineBreakMode = .byWordWrapping
        repositoryNameLabelField.numberOfLines = 0
    }
    
    func addGestureRecognizer(){
        ownerImageView.isUserInteractionEnabled = true
    }
}
