//
//  HomeTableViewController.swift
//  SuperSporCarsApp
//
//  Created by Semih Ekmen on 9.03.2023.
//


/*
 
 Super Sport Cars Application
 
 [INTRODUCTION]
 before the start,we have created this project for see how to use some important structures. on the IPhoneContactApp has splitViewController.
 it is very trouble controller for xCode 14 and IOS 16 versions. But that project include very important structures. In this reason, we have
 created this project similar to Contact app.
 
 what we gonna learn?
 
 -.pList(property list)  usage. Local Data source.
 - creating and working with model file.
 - deeply appDelegate file.
 - table cell examine.
 - listing cell according to alphabet.
 - adding and removing favorites.
 
 
 
 .PLIST AND MODEL FILE
 [DESCRIPTION]
 
 it is a special file that contains data in itself.this file mostly used on macOS,IOS,iPadOS and creating like key-value type with XML structure.
 So, we have created a file, and fill the custom datas. it is very similar to realData on FireBase.
 
 [USAGE]
 
    #create a new file from comand + n and find out the property list icon.
 
    #if you create a file,file gives us root at the begin and type is dictioany. we need to array type, so change it.
 
    #after that, add new item that dictionary. Also, add the image to assets. We gonna create this images.
    [NOTE]you can add new item with source code. right-click to related pList file and open with source code.
 
    #now, we gotta create model file and geting ready pList with proper shape to usage. For doing that, create a new file but this file will be
    only plain swift file.
    
    go the Models/ModelOfCars.swift CP1
    create model's tools. For that, go to Tools/extentions.swift CP2
    we need to pList items key. So, we have create enum class that keeps all keys value. CP3 Tools/enums.swift
 
    #now, we have model file and pList. we gotta creating structure to use it on the screen. creating pListSetsUp file.
    
    create custom errors with enums on the enums.swift file. CP4
    
    create .pListLoader file. So, our datas will be more convenient when we wants to use it. required descriptions on the PlistLoader file. CP5
 
    #now our Model list is ready in the IRepo, we have used the pListLoader. CP6
 
    #well, time to create detail screen. create tableView from library and class and connect on storyboard.
 
    #detail screen, let's have a look at the tableView features. not cell. we have seen cell feature at the above.
    
        contact => we can choose the dynamic or static choice. their difference between similar to listView and listView.builder. I mean, when we
        don't know to how many row is there, we should use the dynamic. Otherwise,we should use the static. In our app, we know that how many row
        there are,so we gonna use the static.
    [NOTE] if you use the static tableView you should remove the numberOfSection,numberOfRowsInSection or cellForRowAt functions. we don't need
    them.
    
        style => plain vs group. if you select the plain there will be more than one row. Otherwise, there will be only you selected row.
        we gonna select the group.

 
 
 APPDELEGATE AND SCENEDELEGATE
 
 [DESCRIPTION]
 
 what is the appDelegate file? It is kind of special structure than conection between your device/simulator and application. You can think, it is
 similar to app's headquarter. There are may functions that you can take control of some run flow. I have taken some notes, go ti file and check them.
 
 
 TABLEVIEW CELL EXAMINE
 
 [USAGE]
 
    #create a tableViewCell class in any swift file and connect on the storyboard.
 
    #time to deeply learn tableViewCell, go the storyboard and select your tabelViewCell. Here is a tips for you, cell view look like flutter listTile
    widget. I mean, it has suffix,prefix subtitle etc.
    
    If you select the cell, its feature:
    
    #accessory=> it's refer to trailing from LisTile. you can add some icons.
    
    #image=> it's refer to leading. we can add any image. In our app, cell image is dynamic. So, we should detect image from list. CP7
    
    #style=> style feature is ready template from IOS developers. You can try them one by one. But we don't need to use it this style. We gonna
    use custom style of us. But even if you should see how to add subtitle. select the storyboard left right or subttitle choice. after that add
    code line. CP8
    
    #Custom styling. you have to read very carefully, it will be confused. First of all select the tableViewCell's style and change it to custom.
    now, we must see the empty line.
 
    #QUICK INFO adjust the cell height. you can do it from stoyrboard. select the ruler icon form section and adjust measure.But IOS gives us ready
    function. CP9
    
    #where we were, yeah we have selected the custom style. we we must see the empty line. we can add label,image etc. and give measure.
    # add image both side of the cell. right side will be car image, other one will be favorite icon image. Of course, the default is hidden.
    # add 2 label like column. These will be title and subtitle.
    # after that, connect all labels and images to cell class. We have already made it. CP10
    # finally, set up these labels and images according to your model. CP11
 
 
 LISTING CELLS ACCORDING TO ALPHABET
 
    [USAGE]
    
 
 
 */




import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad() }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IRepo.shared.cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: IRepo.shared.homeTableCellIdentifier, for: indexPath)
        if let homeCell = cell as? HomeTableViewCell{
            /*
            All of them, before the custom cell.
             
             homeCell.textLabel?.text = "\(IRepo.shared.cars[indexPath.row].brand)"
             homeCell.imageView?.image = IRepo.shared.cars[indexPath.row].image   // CP7
             homeCell.detailTextLabel?.text = IRepo.shared.cars[indexPath.row].year  // CP8
            
             */
            
            homeCell.brandLabel.text = IRepo.shared.cars[indexPath.row].brand       // CP11
            homeCell.carModelLabel.text = IRepo.shared.cars[indexPath.row].model
            homeCell.carImage.image = IRepo.shared.cars[indexPath.row].image
            homeCell.favoriteImage.isHidden = IRepo.shared.cars[indexPath.row].favorite
        }
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {  //CP9
        return CGFloat(100)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailScreen", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailScreen"{
            if let selectedIndexPath = tableView.indexPathForSelectedRow?.row{
                if let detailViewCtrl = segue.destination as? DetailTableViewController{
                    detailViewCtrl.carModel = IRepo.shared.cars[selectedIndexPath]
                }
            }
        }
    }
}
