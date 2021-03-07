//
//  foodsectioncontroller.swift
//  nibm cafe
//
//  Created by Bhanuka Nishen on 2021-03-02.
//

import UIKit
import Firebase
import FirebaseStorage

class foodsec: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
   

    
    var foodfind : [fooddetails] = []
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

        tableview.delegate = self
        tableview.dataSource = self
        
        
        

        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let docRef = db.collection("Fooddetails")
        docRef.getDocuments { (snapshot, error) in
            if error != nil
            {
                print("error")
            }
            else
            {
                for document in (snapshot?.documents)!
                {
                    let dd=document.data()
                   let name = dd["Name"] as! String
                    let discrip = dd["descrip"] as! String
                    let price = dd["price"] as! Float
                    let discount = dd["discount"] as! Int
                    let imageid = dd["id"] as! String
                    
                  
                    
                    
                    
                    let foodget = nibm_cafe.fooddetails(Name:name,discription: discrip,price: price,discount: discount,id: imageid)
                    
                    self.foodfind.append(foodget)
                    
                    
                    
                }
                
                self.tableview.reloadData()
            }
            
            
        }
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension foodsec : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextview = (storyboard?.instantiateViewController(withIdentifier: "detailwithfood") as? detailwithfood)!
        
        self.navigationController?.pushViewController(nextview, animated: true)
        let food = foodfind[indexPath.row]
        nextview.name = food.Name
        nextview.priceget = String( food.price )
        nextview.discripget = foodfind[indexPath.row].discription
        nextview.foodidget = foodfind[indexPath.row].idget
        
    }
}

extension foodsec : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return foodfind.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let food = foodfind[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! tablecell
        
        cell.appearfood(food: food)
        return cell
    }
    
}
