//
//  enums.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//

import Foundation


// CP3
enum SuperCarKeys:String{
    case brand = "brand"
    case model = "model"
    case year = "Year"
    case topSpeed = "Top Speed"
    case imageName = "imageName"
}


// CP4
enum PlistError:Error{
    case InValidPath  // will throw when file doesn't find.
    case parsingProblem // will throw when there is a problem about the parsing process.
}
