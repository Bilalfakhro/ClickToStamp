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
    
    @IBOutlet weak var testLabel: UILabel!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()

        downloadBox()
        
//        var stampcard = StampCard(EmailText: "test", FullNameText: "test 3")
//        print(stampcard.Email)
//        print(stampcard.FullName)
    }
    
    func downloadBox() {
        Database.database().reference().child("Users").observe(.value) { (DataSnapshot) in
            // EXTRACT DATA FROM DATASNAPSHOT
            if let dict = DataSnapshot.value as? [String: Any] {
                print(DataSnapshot.value!)
            }
           // print(DataSnapshot.value!)
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

