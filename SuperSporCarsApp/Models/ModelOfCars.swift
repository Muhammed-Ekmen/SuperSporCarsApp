//
//  ModelOfCars.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//

import Foundation
import UIKit

struct ModelOfCars:Equatable{        //CP1
    
    let brand:String
    let model:String
    let year:String
    let topSpeed:String
    let image:UIImage?
    var favorite:Bool
    
    
    
    // CP24
    static func == (firstModelOfCar:ModelOfCars,secondModelOfCar:ModelOfCars) -> Bool {
        return firstModelOfCar.brand == secondModelOfCar.brand && firstModelOfCar.model == secondModelOfCar.model && firstModelOfCar.year == secondModelOfCar.year && firstModelOfCar.topSpeed == secondModelOfCar.topSpeed
    }
}
