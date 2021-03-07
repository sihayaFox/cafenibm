//
//  ViewController.swift
//  nibm cafe
//
//  Created by Bhanuka Nishen on 2021-03-01.
//

import UIKit
import FirebaseAuth
import Firebase


class regcontrol: UIViewController {

    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var phoneNo: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var registerbtn: UIButton!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
             // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @IBAction func signupHit(_ sender: Any) {
        
       
            let phoneva = phoneNo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailva = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let passva = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: emailva, password: passva) { (result, errr) in
                if errr != nil {
                    
                }
                else
                {
                    let db = Firestore.firestore()
                    db.collection("Userinfo").addDocument(data: ["phonenumber" :phoneva,"Userkey" : result!.user.uid ]) { (erro) in
                        if erro != nil
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
       

        
    }
    

}

