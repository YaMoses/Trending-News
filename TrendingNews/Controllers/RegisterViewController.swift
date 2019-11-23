//
//  RegisterViewController.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/18/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonIsPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordtextField.text!) {
            
            (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                //success
                print("Registraation Successful!")
            }
        }
        
        self.performSegue(withIdentifier: "showCollection", sender: self)
    }
    
   

}
