//
//  SuperheroeViewCell.swift
//  JusticeLeague
//
//  Created by Tardes on 19/12/24.
//

import UIKit

class SuperheroeViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(superheroe:Superheroe) {
        nameLabel.text = superheroe.biography.realName
        avatarImageView.loadFrom(url: superheroe.image.url)
        
    }

}
