//
//  SignUpViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-19.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
   
    @IBOutlet weak var fullNameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SIGN UP BUTTON I DISABLE AT VIEW APPEAR
        signUpButton.isEnabled = false
        // TEXTFIELDS IS EMPTY FUNCTION
        handleTextField()
    }
    
    // KEYBOARD DISMISS ONCLICK ANYWHERE
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // EMPTY TEXTFIELDS , SIGN UP BUTTON DISABALD
    func handleTextField() {
        fullNameTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        emailTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        passwordTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    // IF TEXTFIELDS IS EMPTY, CHANGE BUTTON TO DISABLE AND GIVE IT A LIGHTER COLOR
    @objc func textFieldDidChange() {
        guard let fullname = fullNameTextfield.text, !fullname.isEmpty, let email = emailTextfield.text, !email.isEmpty,
            let password = passwordTextfield.text, !password.isEmpty else {
                signUpButton.setTitleColor(UIColor.lightText, for: UIControl.State.normal)
                signUpButton.isEnabled = false
                return
        }
        // WHEN TEXTFIELDS IS FILED THE SIGN UP BUTTON IS ENABELD
        signUpButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        signUpButton.isEnabled = true
    }

    // FIREBASE - UPPLOAD AND SAVE DATATO USER AND USERS ID AND EMAIL AND PROFILEIMAGE
    @IBAction func signUpButtonTapped(_ sender: Any) {
        view.endEditing(true)
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion:{ (user, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            // FIREBASE DATABASE
            let uid = user?.user.uid
            let ref = Database.database().reference()
            let usersReference = ref.child("Users")
            //   print(usersReference.description()) : https://clicktostamp.firebaseio.com/Users
            let newUserReference = usersReference.child(uid!)
            newUserReference.setValue(["Name": self.fullNameTextfield.text!, "Email": self.emailTextfield.text!])
            self.performSegue(withIdentifier: "signUpToCardSegue", sender: self)
        })
    }
    
    @IBAction func dismiss_onClick(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
