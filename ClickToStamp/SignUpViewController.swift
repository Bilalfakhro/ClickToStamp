//
//  SignUpViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-19.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
   
    @IBOutlet weak var fullNameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleTextField()
    }
    
    // TEXTFIELDS IF EMPTY, TURN BUTTON TO UNCLICKABLE
    func handleTextField() {
        fullNameTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        emailTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        passwordTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    // IF TEXTFIELDS IS EMPTY, COLLOR CHANGE TO DARKER COLOR SIGNUP BUTTON IS NOT CLICKABLE
    @objc func textFieldDidChange() {
        guard let fullname = fullNameTextfield.text, !fullname.isEmpty, let email = emailTextfield.text, !email.isEmpty,
            let password = passwordTextfield.text, !password.isEmpty else {
                signUpButton.setTitleColor(UIColor.lightText, for: UIControl.State.normal)
                signUpButton.isEnabled = false
                return
        }
        // CHANGE BUTTONS COLLOR TO DEFAULT COLOR AND IS CLICKABLE
        signUpButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signUpButton.isEnabled = true
    }

    // FIREBASE - UPPLOAD AND SAVE DATATO USER AND USERS ID AND EMAIL AND PROFILEIMAGE
    @IBAction func signUpButton(_ sender: Any) {
      print("Sign up button tapped")
    }
    
    @IBAction func dismiss_onClick(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
