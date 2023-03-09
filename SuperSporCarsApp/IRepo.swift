//
//  IRepo.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//

import Foundation


class IRepo{
    private init() {}
    
    static let shared = IRepo()
    
    var homeTableCellIdentifier:String = "cellOfHome"
    var cars:[ModelOfCars] = PlistLoader.getCars     //CP6
}
