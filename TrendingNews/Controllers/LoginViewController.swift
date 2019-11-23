//
//  LoginViewController.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/18/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonIsPressed(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {
            (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                print("LogIn Successful!")
            }
        }
        
        self.performSegue(withIdentifier: "loginShow", sender: self)
    }
    
    
}
