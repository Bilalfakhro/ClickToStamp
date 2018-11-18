//
//  ProfileViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-18.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameTextfield: UITextField!
    @IBOutlet weak var profileEmailTextfield: UITextField!
    @IBOutlet weak var profileCityTextfield: UITextField!
    @IBOutlet weak var profileGenderTextfield: UITextField!
    
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // ActivityIndicator to choose between photoLibary or camera.
    func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: view.bounds)
        activityIndicator.style = .whiteLarge
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.25)
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    // Remove the ActivityIndicator
    func removeActivityIndicator() {
        activityIndicator.removeFromSuperview()
        activityIndicator = nil
    }
    
    @IBAction func changePicture(_ sender: Any) {
        let imagePickerSelector = UIAlertController(title: "Select Photo", message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let camera = UIAlertAction(title: "Take Photo", style: .default, handler: { (UIAlertAction) in
                let profileImage = UIImagePickerController()
                profileImage.delegate = self
                profileImage.sourceType = .camera
                profileImage.allowsEditing = true
                self.present(profileImage, animated: true, completion: nil)
            })
            imagePickerSelector.addAction(camera)
        }
        
        let libary = UIAlertAction(title: "Upload from Libary", style: .default, handler: { (UIAlertAction) in
            let profileImage = UIImagePickerController()
            profileImage.delegate = self
            profileImage.sourceType = .photoLibrary
            profileImage.allowsEditing = true
            self.present(profileImage, animated: true, completion: nil)
        })
        imagePickerSelector.addAction(libary)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        imagePickerSelector.addAction(cancel)
        
        present(imagePickerSelector, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedPhoto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        addActivityIndicator()
        dismiss(animated: true, completion: nil)
        print("Image Saved")
    }

    
    // BACK HOME
    @IBAction func profileBackHome(_ sender: Any){
        self.dismiss(animated: false, completion: nil)
    }
}
