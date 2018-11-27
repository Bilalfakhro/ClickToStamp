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
    
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var backgroundCardImage: UIImageView!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var qrScanButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    var ref : DatabaseReference!
    var userRef : DatabaseReference!
    var restuarantsRef : DatabaseReference!
    var lunchRef : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uid = Auth.auth().currentUser?.uid
        ref = Database.database().reference()
        userRef = self.ref.child("Users").child(uid!)
        restuarantsRef = self.userRef.child("Valfarden")
        lunchRef = self.restuarantsRef.child("Lunch")

        getStamp()
        viewWillAppear(true)
    }
    

    func getStamp() {
        var aLunch: Int = 1
        var bLunch: Int = 2
        var cLunch: Int = 3
        var dLunch: Int = 4
        var eLunch: Int = 5
        var fLunch: Int = 6
        var gLunch: Int = 7
        var hLunch: Int = 8
        var jLunch: Int = 9
        var lLunch: Int = 10
//        let item: String = self.label10.text!
//        self.lunchRef.setValue("10")
        
    lunchRef.observe(.value, with: { (snapshot) in
        if let value: Any = snapshot.value {
            let data = snapshot.value as Any
            let dLunch = data as! Int
            let dNewLunch = dLunch
            self.label4.text = "\(dLunch)"
            if dLunch == 4 {
                print(dNewLunch)
                self.lunchRef.setValue("Lunch")
            } else {
                print("NOO")
                }
            }
        })
        
        
//        restuarantsRef.observe(.value, with: { (snapshot) in
//            if let data: Int = snapshot.value as? Int {
//                let cLunch = data as Int
//                print(data)
//                if cLunch == 5 {
//                    self.label3.text = "\(cLunch)"
//                    print(cLunch)
//                } else {
//                    print("NOO")
//                }
//            }
//        })
//        lunchRef.observe(.value, with: { (snapshot) in
//            if let value: Any = snapshot.value {
//                //there is data available
//                let data = snapshot.value as Any
//                let dLunch = data as! Int
//                let dNewLunch = dLunch
//                self.label4.text = "\(dLunch)"
//                if dLunch == 4 {
//                    print(dNewLunch)
//                    self.lunchRef.setValue("Lunch")
//                } else {
//                    print("NOO")
//                }
//            }
//        })
//        lunchRef.observe(.value, with: { (snapshot) in
//            if let value: Any = snapshot.value {
//                //there is data available
//                let data = snapshot.value as Any
//                let eLunch = data as! Int
//                self.label5.text = "\(eLunch)"
//                let eNewLunch = eLunch
//                if eLunch == 5 {
//                    print(eNewLunch)
//                    self.lunchRef.setValue(eNewLunch)
//                } else {
//                    print("NOO")
//                }
//            }
//        })
//        lunchRef.observe(.value, with: { (snapshot) in
//            if let value: Any = snapshot.value {
//                //there is data available
//                let data = snapshot.value as Any
//                let fLunch = data as! Int
//                self.label6.text = "\(fLunch)"
//                let fNewLunch = fLunch
//                if bLunch == 6 {
//                    print(fNewLunch)
//                    self.lunchRef.setValue(fNewLunch)
//                } else {
//                    print("NOO")
//                }
//            }
//        })
//        lunchRef.observe(.value, with: { (snapshot) in
//            if let value: Any = snapshot.value {
//                //there is data available
//                let data = snapshot.value as Any
//                let gLunch = data as! Int
//                self.label7.text = "\(gLunch)"
//                let gNewLunch = fLunch
//                if gLunch == 7 {
//                    print(gNewLunch)
//                    self.lunchRef.setValue(gNewLunch)
//                } else {
//                    print("NOO")
//                }
//            }
//        })
//        lunchRef.observe(.value, with: { (snapshot) in
//            if let value: Any = snapshot.value {
//                //there is data available
//                let data = snapshot.value as Any
//                let hLunch = data as! Int
//                self.label8.text = "\(hLunch)"
//                let hNewLunch = hLunch
//                if hLunch == 8 {
//                    print(hNewLunch)
//                    self.lunchRef.setValue(hNewLunch)
//                } else {
//                    print("NOO")
//                }
//            }
//        })
//        lunchRef.observe(.value, with: { (snapshot) in
//            if let value: Any = snapshot.value {
//                //there is data available
//                let data = snapshot.value as Any
//                let jLunch = data as! Int
//                self.label9.text = "\(jLunch)"
//                let jNewLunch = jLunch
//                if jLunch == 9 {
//                    print(jNewLunch)
//                    self.lunchRef.setValue(jNewLunch)
//                } else {
//                    print("NOO")
//                }
//            }
//        })
//        lunchRef.observe(.value, with: { (snapshot) in
//            if let value: Any = snapshot.value {
//                //there is data available
//                let data = snapshot.value as Any
//                let lLunch = data as! Int
//                self.label10.text = "\(lLunch)"
//                let lNewLunch = lLunch
//                if lLunch == 10 {
//                    print(lNewLunch)
//                    self.lunchRef.setValue(lNewLunch)
//                } else {
//                    print("NOO")
//                }
//            }
//        })
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

