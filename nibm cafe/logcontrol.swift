//
//  logincontrollerViewController.swift
//  nibm cafe
//
//  Created by Bhanuka Nishen on 2021-03-01.
//

import UIKit
import FirebaseAuth

class logcontrol: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @IBAction func loginhit(_ sender: Any) {
        
        
            let email2 = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password2 = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email2, password: password2) { (Result, Error) in
                if Error != nil
                {
                }
                else
                {
                   
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "hometabbar") as! UITabBarController

                        self.navigationController?.pushViewController(nextViewController, animated: true)
                }
            }
            
            
       
        
    }
    
     

}
