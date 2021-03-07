//
//  tablecellcontrollerTableViewCell.swift
//  nibm cafe
//
//  Created by Bhanuka Nishen on 2021-03-02.
//

import UIKit
import FirebaseStorage

class tablecell: UITableViewCell {

    @IBOutlet weak var FoodName: UILabel!
    
    @IBOutlet weak var discription: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var discount: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var idlbl: UILabel!
    
    func appearfood(food:fooddetails) {
        FoodName.text = food.Name
        discription.text = food.discription
        price.text =  String( food.price )
        if food.discount == 0
        {
            discount.text = String( food.discount)
            discount.isHidden = true
        }
        else
        {
        discount.text = String( food.discount) + "%OFF"
            discount.isHidden = false
        }
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let path = "images/"+food.idget+".jpg"
        
       
        let formattedString = path.replacingOccurrences(of: " ", with: "")
        let islandRef = storageRef.child(formattedString)
        
        islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
           print("error")
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            self.photo.image = image
            
            
          }
        }
        
        idlbl.text = food.idget
        idlbl.isHidden = true
        
        
        
            
        
    }
}
