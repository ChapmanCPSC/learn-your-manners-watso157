//
//  ViewController.swift
//  HelloName
//
//  Created by Christopher Watson on 3/7/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblHelloName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnGoTouchedUpInside(sender: AnyObject) {
        
        let name = self.tfName.text
        self.lblHelloName.text = "Hello \(name!)"
        self.tfName.delegate = self
    }
    
    @IBAction func changedTextInField(sender: UITextField) {
        
//        self.lblHelloName.text = "Hello \(self.tfName.text!)"
        
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        self.lblHelloName.text = "Hello \(textField.text!)"
        
        return true
    }
    
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        print("Hello")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

