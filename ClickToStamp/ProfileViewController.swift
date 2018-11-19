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
    
    // ActivityIndicator a view that shows that a task is in progress.
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
            // CAMERA
            let camera = UIAlertAction(title: "Take Photo", style: .default, handler: { (UIAlertAction) in
            let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            })
            imagePickerSelector.addAction(camera)
        }
            // PHOTOLIABRY
            let libary = UIAlertAction(title: "Upload from Libary", style: .default, handler: { (UIAlertAction) in
            let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        })
        imagePickerSelector.addAction(libary)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        imagePickerSelector.addAction(cancel)
        
        present(imagePickerSelector, animated: true, completion: nil)
    }
    
    // IMAGE TAKEN
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        let pickedImage = info[.originalImage] as! UIImage
        profileImage.image = pickedImage

        // CLOSE WINDOWS AFTER TAKEN THE IMAGE
        self.dismiss(animated: true, completion: nil)
  /*
        // ENCODING IMAGE
        let image = UIImage(named: "profileImage")
        let imageData: NSData = image!.pngData()! as NSData
    */
        // SAVED IMAGE
        UserDefaults.standard.set(pickedImage, forKey: "savedImage")
        
        // DECODE IMAGE
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        profileImage.image = UIImage(data: data as Data)
    }

    // BACK HOME
    @IBAction func profileBackHome(_ sender: Any){
        self.dismiss(animated: false, completion: nil)
    }
}
