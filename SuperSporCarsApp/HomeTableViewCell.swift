//
//  HomeTableViewCell.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    
    // CP10
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
