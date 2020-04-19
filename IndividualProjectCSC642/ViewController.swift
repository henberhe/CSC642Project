//
//  ViewController.swift
//  IndividualProjectCSC642
//
//  Created by Henok on 3/11/20.
//  Copyright © 2020 Henok. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase



class ViewController: UIViewController {

   
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    //var ref : DatabaseReference?
    var signupMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //if Auth.auth().currentUser != nil {
            //ref?.child("Coffee").child("1").setValue(["name":"first"])
        //}
    }

    @IBAction func loginCreate(_ sender: Any) {
        if let email = emailText.text {
            if let password = passwordText.text{
                if signupMode {
                    //Sign Up
                    Auth.auth().createUser(withEmail: email, password: password, completion:  { (user, error) in
                        if let error = error{
                            print(error.localizedDescription)
                        } else {
                            print(" Sign up was Sucessful!!")
                            self.performSegue(withIdentifier: "moveTohomepage", sender: nil)
                        }
                    })
                }else{
                    //Log in
                    Auth.auth().signIn(withEmail: email, password: password, completion:{
                        (user, error) in
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            print("Login was Sucessful!!")
                            self.performSegue(withIdentifier: "moveTohomepage", sender: nil)
                        }
                    })
                    
                }
            }
        }
    }
    
    @IBAction func signupCreate(_ sender: Any) {
        if signupMode {
            //Switch to login
            signupMode = false
            loginButton.setTitle("Login", for: .normal)
            signupButton.setTitle("Switch to Sign up", for: .normal)
        } else {
            //Switch to Create Account
            signupMode = true
            loginButton.setTitle("Sign Up", for: .normal)
            signupButton.setTitle("Switch to Login", for: .normal)
        }
        
    }
    
    
}

