//
//  SettingsVC.swift
//  watsonChristopher_iOSAssignment4
//
//  Created by Christopher Watson on 4/27/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var tfEmailAddress: UITextField!
    @IBOutlet weak var btnSaveEmail: UIButton!
    @IBOutlet weak var lblOkay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfEmailAddress.hidden = false
        lblOkay.text? = "Send Summary Emails to:"
        btnSaveEmail.hidden = false
    }

    @IBAction func tappedSaveEmail(sender: AnyObject) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let email = String(tfEmailAddress.text!)
        userDefaults.setValue(email, forKey: "email")
        userDefaults.synchronize()
        tfEmailAddress.hidden = true
        lblOkay.text? = "Email Saved!"
        btnSaveEmail.hidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
