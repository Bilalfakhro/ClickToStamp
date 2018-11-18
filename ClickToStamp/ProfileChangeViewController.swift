//
//  ProfileChangeViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-18.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit

class ProfileChangeViewController: UIViewController {
    @IBOutlet weak var itemTextfield: UITextField!
    @IBOutlet weak var profileChangeLabel: UILabel!
    
    var theitem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        itemTextfield.text = theitem
        
        // Förberedd övergången till SettingsListViewController
        performSegue(withIdentifier: "profileToChangeSegue", sender: self)
    }
    
    // SAVE data on device.
    @IBAction func saveItem(_ sender: Any) {
        
        theitem = itemTextfield.text!
        UserDefaults.standard.set(theitem, forKey: theitem)
        
        // Tryck på knappen SAVE och gå tillbaka till SettingsViewcontroller.
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func listBackToProfile(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
