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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Firebase Database Reference
        var ref: DatabaseReference!
        ref = Database.database().reference()
   
ref.child("userID").child("Valfarden").child("QRNewCard").child("Lunch").child("809138901471u41mfaioj").setValue("0")
ref.child("userID").child("Valfarden").child("QRStampCard").child("Lunch").child("852739572975020+rufjkl").setValue("4")
ref.child("userID").child("Valfarden").child("QRNewCard").child("Soppa").child("85409q9598twifjlm").setValue("0")
ref.child("userID").child("Valfarden").child("QRStampCard").child("Soppa").child("855308520iofkcld").setValue("6")
        
    }
}

