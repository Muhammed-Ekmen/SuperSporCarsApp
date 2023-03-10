//
//  DetailTableViewController.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var carModel:ModelOfCars?
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var topSpeedLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: HomeTableViewControllerDelegate?  // CP19
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDatas()
    }
    
    func setUpDatas(){
        guard let dummyCarModel = carModel else {return}
        brandLabel.text = dummyCarModel.brand
        carModelLabel.text = dummyCarModel.model
        yearLabel.text = dummyCarModel.year
        topSpeedLabel.text = "\(dummyCarModel.topSpeed)/Kmh"
        detailImage.image = dummyCarModel.image
        
        if dummyCarModel.favorite {
            favoriteButton.setTitle("Remove From Favorites", for: UIControl.State.normal)
        }else{
            favoriteButton.setTitle("Add To Favorites", for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func favoriteButtonAction(_ sender: UIButton) {       // CP20
        guard let dummyCarModel = carModel else {return}
        
        carModel?.favorite = !dummyCarModel.favorite
        
        if (carModel?.favorite)!{
            favoriteButton.setTitle("Remove From Favorites", for: UIControl.State.normal)
        }else{
            favoriteButton.setTitle("Add To Favorites", for: UIControl.State.normal)
        }
        delegate?.markCarAsFavorite(carModel: carModel!)
        
    }
}
