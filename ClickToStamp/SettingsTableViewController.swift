//
//  SettingsTableViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-21.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit

var label = ["Privacy Policy", "Deactivate", "App Version", "Feedback / Contact Us", "Logout"]
var theItems = ["blalala", "hohooh", "hfkaafalmlfm", "jfgaspiojfoewjfo", "angakngaenoamfl"]
var myIndex = 0

class SettingsTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return label.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = label[indexPath.row]
      /*
        // Change background Color to trasparent
        cell.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        cell.backgroundColor = .clear
        */
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "settingsToTableViewSegue", sender: self)
    }
    @IBAction func backToHome(_ sender: Any) {
        print("Back to home")
        performSegue(withIdentifier: "backToMenuSegue", sender: self)
    }
}
