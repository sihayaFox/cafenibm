//
//  detailfoodcontrollerViewController.swift
//  nibm cafe
//
//  Created by Bhanuka Nishen on 2021-03-03.
//

import UIKit
import FirebaseStorage

class detailwithfood: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var foodname: UILabel!
    
    
    @IBOutlet weak var price: UILabel!
    
    
    @IBOutlet weak var note: UILabel!
    
    var name = ""
    var priceget = ""
    var discripget = ""
    var foodidget = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        foodname.text = name
        
        price.text = "RS."+priceget
        
        note.text = discripget
        
        loadimagefoodimage()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false    }
    
    func loadimagefoodimage() {
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let path = "images/"+foodidget+".jpg"
        
       
        let formattedString = path.replacingOccurrences(of: " ", with: "")
        let islandRef = storageRef.child(formattedString)
        
        islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
           print("error")
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            self.image.image = image
            
            
          }
        }
    }
    

   

}
