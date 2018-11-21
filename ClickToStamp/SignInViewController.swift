//
//  SignInViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-19.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // SIGN UP BUTTON I DISABLE AT VIEW APPEAR
        signInButton.isEnabled = false
        // TEXTFIELDS IS EMPTY FUNCTION
        handleTextField()
    }
    
    // KEYBOARD DISMISS ONCLICK ANYWHERE
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // ALLOW USER TO STAY LOGGED ALL THE TIME UNTIL LOGOUT
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
        self.performSegue(withIdentifier: "signInToCardSegue", sender: self)
        }
    }
    
    // EMPTY TEXTFIELDS , SIGN UP BUTTON DISABALD
    func handleTextField() {
        emailTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        passwordTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    // IF TEXTFIELDS IS EMPTY, CHANGE BUTTON TO DISABLE AND GIVE IT A LIGHTER COLOR
    @objc func textFieldDidChange() {
        guard let email = emailTextfield.text, !email.isEmpty,
            let password = passwordTextfield.text, !password.isEmpty else {
                signInButton.setTitleColor(UIColor.lightText, for: UIControl.State.normal)
                signInButton.isEnabled = false
                return
        }
        // WHEN TEXTFIELDS IS FILED THE SIGN UP BUTTON IS ENABELD
        signInButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        signInButton.isEnabled = true
    }

    @IBAction func signInButtonTapped(_ sender: Any) {
        view.endEditing(true)
        AuthService.signIn(email: emailTextfield.text!, password: passwordTextfield.text!, onSuccess: {
            self.performSegue(withIdentifier: "signInToCardSegue", sender: self)
        }, onError: {error in
            print(error)
        })
    }
    
    @IBAction func dontHaveAccountButton(_ sender: UIButton) {
    }
}
