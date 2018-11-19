//
//  SignUpViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-19.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullNameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       // TAPP ON THE PROFILE IMAGE TO CHANGE IMAGE
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
       
        handleTextField()
    }
    
    func handleTextField() {
        fullNameTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        emailTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        passwordTextfield.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange() {
        guard let fullname = fullNameTextfield.text, !fullname.isEmpty, let email = emailTextfield.text, !email.isEmpty,
            let password = passwordTextfield.text, !password.isEmpty else {
                signUpButton.setTitleColor(UIColor.lightText, for: UIControl.State.normal)
                signUpButton.isEnabled = false
                return
        }
        
        signUpButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signUpButton.isEnabled = true
    }
    
    @objc func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func dismiss_onClick(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: { (User, error) in
        if error != nil {
        print(error!.localizedDescription)
        return
    }
            
        let uid = User?.user.uid
        let storageRef = Storage.storage().reference(forURL: "gs://clicktostamp.appspot.com").child("Profile_image").child(uid!)
        if let profileImg = self.selectedImage,
            let imageData = UIImage.jpegData(compressionQuality: 0.1)
            {
            storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
        if error != nil {
        return
            }
            let profileImageUrl = metadata?.downloadURL()?.absoluteString
            
            self.setUserInfomation(profileImageUrl: profileImageUrl!, fullname:
                self.fullNameTextfield.text!, email: self.emailTextfield.text!, uid: uid!)
            })
        }
    })
}
    
func setUserInfomation(profileImageUrl: String, fullname: String, email: String, uid: String) {
    let ref = Database.database().reference()
    let usersReference = ref.child("Users")
    let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["Fullname": fullname, "Email": email, "ProfileImageUrl": profileImageUrl])
    self.performSegue(withIdentifier: "signUpGoToHomeSegue", sender: nil)
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
    if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
    selectedImage = image
    profileImage.image = image
    }
        dismiss(animated: true, completion: nil)
    }
}
