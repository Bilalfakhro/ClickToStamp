//
//  ViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-17.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit
import Firebase

class StampCardViewController: UIViewController {
    
    @IBOutlet weak var stampCardViewLabel: UILabel!
    @IBOutlet weak var backToMenu: UIButton!
    
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var backgroundCardImage: UIImageView!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    @IBOutlet weak var imageFive: UIImageView!
    @IBOutlet weak var imageSix: UIImageView!
    @IBOutlet weak var imageSeven: UIImageView!
    @IBOutlet weak var imageEight: UIImageView!
    @IBOutlet weak var imageNine: UIImageView!
    @IBOutlet weak var imageTen: UIImageView!

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var qrScanButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Firebase Database Reference
        ref = Database.database().reference()
        /*
        // ENCODING IMAGE
        let image = UIImage(named: "checkBox.png")
        let imageData: NSData = image!.pngData()! as NSData
     
        // SAVED IMAGE
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        
        // DECODE IMAGE
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        imageOne.image = UIImage(data: data as Data)
         */
        
        // SPARA DATA PÅ FIREBASE
    ref.child("userID").child("Valfarden").child("QRNewCard").child("Lunch").child("8091389").setValue("0")
    ref.child("userID").child("Valfarden").child("QRStampCard").child("Lunch").child("852739572").setValue("7")

        // HÄMTA DATA FRÅN FIREBASE
        // let userID = Auth.auth().currentUser?.uid
        ref.child("userID").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
           let value = snapshot.value as? NSDictionary
 
            print(value)
            // let username = value?["username"] as? String ?? ""
            // let user = User(username: username)
 
            // ...
        })
        { (error) in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func backToMenu(_ sender: UIButton) {
        self.performSegue(withIdentifier: "backToMenuSegue", sender: self)
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "cardToSettingsSegue", sender: self)
    }
    
    @IBAction func qrScanButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "cardToQRSegue", sender: self)
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.present(signInVC, animated: false, completion: nil)
    }
    
    
    
}

