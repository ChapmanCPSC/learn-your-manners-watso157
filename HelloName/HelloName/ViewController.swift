//
//  ViewController.swift
//  HelloName
//
//  Created by Christopher Watson on 3/7/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblHelloName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnGoTouchedUpInside(sender: AnyObject) {
        
        let name = self.tfName.text
        self.lblHelloName.text = "Hello \(name!)"
        
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        print("Hello")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

