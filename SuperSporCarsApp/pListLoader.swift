//
//  pListLoader.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//

import Foundation


// CP 5

struct PlistLoader{
    static private func getCarsData(fileName:String,extention_ : String)throws -> [[String:String]]{
        
        
        
        //Find Out The File Path. Bundle is an object that we can reach all structures on the main flow.
        guard let path = Bundle.main.path(forResource: fileName, ofType: extention_) else{
            throw PlistError.InValidPath
        }
        
        //Getting Datas From .pList file. NSARRAY. we can import different structtures to our project thanks to NsArray.
        //For instance, our project needs to XML file, and we are using the NsArray.
        guard let data = NSArray(contentsOfFile: path) as? [[String:String]] else{
            throw PlistError.parsingProblem
        }
        
        return data
        
    }
    
    // In here, we have created the function that it gives us propert data to use them on the UI.
    static var getCars:[ModelOfCars] {
        let data = try! getCarsData(fileName: "supercars", extention_: "plist")  // we have entered the filename and its file extention.
        return data.compactMap {    ModelOfCars(data: $0)   }       // it is similar to jsonDecedo/Encode
    }
    
    
}





/*
this PlistLoader class incluide the getCars static function. So, we will be able to call datas thanks to this strucure.
 
*/
