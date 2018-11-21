//
//  MainViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-18.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    @IBOutlet weak var qrScanner: UIButton!
    @IBOutlet weak var cardImage: UIButton!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var logOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // QuickScanner Buttons on MainViewController
    @IBAction func qrScannerButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "qrScannerSegue", sender: self)
    }
    
    // Profile Buttons on MainViewController
    @IBAction func cardImageButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "cardImageSegue", sender: self)
    }
    
    // Settings Buttons on MainViewController
    @IBAction func settingsButton(_ sender: Any) {
        self.performSegue(withIdentifier: "mainToSettingsSegue", sender: self)
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

