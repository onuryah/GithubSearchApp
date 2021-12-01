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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
