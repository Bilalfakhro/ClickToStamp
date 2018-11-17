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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Firebase Database Reference
        var ref: DatabaseReference!
        ref = Database.database().reference()
   
ref.child("userID").child("Valfarden").child("QRNewCard").child("Lunch").child("809138901471u41mfaioj").setValue("0")
ref.child("userID").child("Valfarden").child("QRStampCard").child("Lunch").child("852739572975020+rufjkl").setValue("4")
ref.child("userID").child("Valfarden").child("QRNewCard").child("Lunch").child("809138902u3923").setValue("0")
ref.child("userID").child("Valfarden").child("QRStampCard").child("Lunch").child("852739573942ur").setValue("3")
ref.child("userID").child("Valfarden").child("QRNewCard").child("Soppa").child("85409q9598twifjlm").setValue("0")
ref.child("userID").child("Valfarden").child("QRStampCard").child("Soppa").child("855308520iofkcld").setValue("6")
        
ref.child("userID").child("Valfarden").child("QRNewCard").child("Soppa").child("85409fjaiojfa9r").setValue("0")
ref.child("userID").child("Valfarden").child("QRStampCard").child("Soppa").child("85530oireu9rue").setValue("2")
        
    }
    
    @IBAction func backToMenu(_ sender: UIButton) {
    print("Back to Menu Tapped")
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

