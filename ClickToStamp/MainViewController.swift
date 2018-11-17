//
//  MainViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-18.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var qrScanner: UIButton!
    @IBOutlet weak var profile: UIButton!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var loggout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // QuickScanner Buttons on MainViewController
    @IBAction func qrScannerButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "qrScannerSegue", sender: self)
    }
    
    // Profile Buttons on MainViewController
    @IBAction func profileButton(_ sender: Any) {
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    // Settings Buttons on MainViewController
    @IBAction func settingsButton(_ sender: Any) {
        self.performSegue(withIdentifier: "settingsSegue", sender: self)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
      /*  let signOutController = SignInViewController()
        let signInNavigationController = UINavigationController(rootViewController: signOutController)
        
        let alert = UIAlertController(title: "My Title", message: "My Message", preferredStyle: .alert)
        
        let actionYes = UIAlertAction(title: "Yes", style: .default, handler: { action in
            print("action yes handler")
        })
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
            print("action cancel handler")
        })
        
        alert.addAction(actionYes)
        alert.addAction(actionCancel)
        
        DispatchQueue.main.async {
            self.present(signInNavigationController, animated: true, completion: nil)
        }
         */
        
    }
}

