//
//  TableViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-20.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titelTextLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = label[myIndex]
        titelTextLabel.text = theItems[myIndex]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
