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

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var qrScanButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    var ref: DatabaseReference!
    
   // var checkImage = UIImage(named: "checkBox")
   // var unCheckImage = UIImage(named: "unCheckBox")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Firebase Database Reference
        ref = Database.database().reference()
        
        // ENCODING IMAGE
        let image = UIImage(named: "checkBox.png")
        let imageData: NSData = image!.pngData()! as NSData
     
        // SAVED IMAGE
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        
        // DECODE IMAGE
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        imageOne.image = UIImage(data: data as! Data)
 
        
/*      if let checkImage = UIImage(named: "checkBox.png") {Sa
            let pngdata = checkImage.pngData()
        }
        
        if let unCheckImage = UIImage(named: "unCheckBox.png") {
            let pngdata = unCheckImage.pngData()
    }
 */
   /*
        // SPARA DATA PÅ FIREBASE
    ref.child("userID").child("Valfarden").child("QRNewCard").child("Lunch").child("809138901471u41mfaioj").setValue("0")
    ref.child("userID").child("Valfarden").child("QRStampCard").child("Lunch").child("852739572975020+rufjkl").setValue("7")
        
    //ref.child("userID").child("Valfarden").child("QRNewCard").child("Soppa").child("85409fjaiojfa9r").setValue("0")
    //ref.child("userID").child("Valfarden").child("QRStampCard").child("Soppa").child("85530oireu9rue").setValue("2")
 
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
        */
    }
    
    @IBAction func backToMenu(_ sender: UIButton) {
    print("Back to Menu Tapped")
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        print("Profile Button Tapped")
    }
    
    @IBAction func qrScanButtonTapped(_ sender: Any) {
        print("QR Scan Button Tapped")
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        print("LogOut Button Tapped")
    }
    
    
    
}

