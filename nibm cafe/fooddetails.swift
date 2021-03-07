//
//  food.swift
//  nibm cafe
//
//  Created by Bhanuka Nishen on 2021-03-02.
//

import Foundation
import UIKit

class fooddetails {
    var Name : String
    var discription : String
    var price : Float
    var discount : Int
    var idget : String
   
    
    init(Name : String,discription : String,price : Float,discount:Int,id:String) {
        
        self.Name = Name
        self.discription = discription
        self.price = price
        self.discount = discount
        self.idget = id
        
        
    }
}
