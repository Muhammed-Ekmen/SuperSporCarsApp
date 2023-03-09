//
//  DetailTableViewController.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var carModel:ModelOfCars?
    var dummyModel:ModelOfCars?
    
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var topSpeedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carModel = dummyModel
    }
    
    func setUpDatas(incomingCarModel:ModelOfCars){
        dummyModel = incomingCarModel
        if isViewLoaded{
            brandLabel.text = dummyModel?.brand
            carModelLabel.text = dummyModel?.model
            yearLabel.text = dummyModel?.year
            topSpeedLabel.text = dummyModel?.topSpeed
        }
    }
}
