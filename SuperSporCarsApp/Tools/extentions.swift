//
//  extentions.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//

import Foundation
import UIKit

extension ModelOfCars {                                                         //CP2
    init?(data: [String:String]) {
        guard let brandData = data[SuperCarKeys.brand.rawValue],
              let modelData =  data[SuperCarKeys.model.rawValue],
              let yearData = data[SuperCarKeys.year.rawValue],
              let topSpeedData = data[SuperCarKeys.topSpeed.rawValue] else {return nil}
        brand = brandData
        model = modelData
        year = yearData
        topSpeed = topSpeedData
        favorite = false
        if let imageData = data[SuperCarKeys.imageName.rawValue]{
            image = UIImage(named: imageData)
        }else{
            image = nil
        }
    }
}
