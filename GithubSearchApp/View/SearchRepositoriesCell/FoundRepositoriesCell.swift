//
//  FoundRepositoriesCell.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 29.11.2021.
//

import UIKit

protocol FoundRepositoriesCellDelegate : AnyObject{
    func didTapButton()
}
class FoundRepositoriesCell: UITableViewCell {
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerUsernameLabelField: UILabel!
    @IBOutlet weak var repositoryNameLabelField: UILabel!
    @IBOutlet weak var peginateLabelField: UILabel!
    weak var delegate : FoundRepositoriesCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fixLabelFields()
        moveSegue()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func buttonClicked(_ sender: Any) {
        delegate?.didTapButton()
    }
    
}
extension FoundRepositoriesCell{
    private func fixLabelFields(){
        ownerUsernameLabelField.lineBreakMode = .byWordWrapping
        ownerUsernameLabelField.numberOfLines = 0
        repositoryNameLabelField.lineBreakMode = .byWordWrapping
        repositoryNameLabelField.numberOfLines = 0
    }
    private func moveSegue(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapToImage))
    }
    @objc func tapToImage(){
        print("kontrol")
    }
}
