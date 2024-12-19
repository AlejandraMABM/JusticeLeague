//
//  DetailViewController.swift
//  JusticeLeague
//
//  Created by Tardes on 19/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var superheroe:Superheroe!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = superheroe.name
        avatarImageView.loadFrom(url: superheroe.image.url)
    }
    

}
