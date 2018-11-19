//
//  SignInViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-19.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signInButton(_ sender: UIButton) {
        print("SignIn button tapped")
    }
    @IBAction func dontHaveAccountButton(_ sender: UIButton) {
        print("Dont have a account button tapped")
    }
    

}
