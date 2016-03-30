//
//  ViewController.swift
//  watsonChristopher_Assignment4
//
//  Created by Christopher Watson on 3/30/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblStudyBuddy: UILabel!
    @IBOutlet weak var lblConceptToKnow: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnPass: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblRemainingConceptCount: UILabel!
    var rando = 1
    var timerCount = 30
    var conceptArray : [String] = ["Let vs Var", "Computed Initializers", "Computed Variables", "Setter Observers", "Functions", "External Parameters", "Default Parameters", "Anonymous Functions", "Optional Chaining", "Failable Initializers", "Casting", "Class Methods", "Extensions", "Enumeration", "Error Handling", "Dictionaries", "Conditional Binding", "Protocols", "Inheritance", "Structs", "Enums", "Classes", "Subscripts", "Setter Observers"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnNext.hidden = true
        self.btnPass.hidden = true
        self.lblConceptToKnow.hidden = true
        self.lblRemainingConceptCount.hidden = true
        
        self.btnPass.layer.cornerRadius = 4.0
        self.btnNext.layer.cornerRadius = 4.0
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateTimer() {
        if(timerCount > 0) {
            lblTimer.text = String(--timerCount)
            self.view.backgroundColor = UIColor.whiteColor()
        }
        if (timerCount == 0){
            self.view.backgroundColor = UIColor.redColor()
            tappedBtnPass(self)
        }
    }

    @IBAction func tappedBtnStart(sender: AnyObject) {
        self.btnStart.hidden = true
        self.btnPass.hidden = false
        self.btnNext.hidden = false
        self.lblConceptToKnow.hidden = false
        self.lblRemainingConceptCount.hidden = false
        
        rando = Int(random() % conceptArray.count)
        self.lblConceptToKnow.text = conceptArray[rando]
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    @IBAction func tappedBtnPass(sender: AnyObject) {
        rando = Int(random() % conceptArray.count)
        self.lblConceptToKnow.text = conceptArray[rando]
        self.lblRemainingConceptCount.text = "Concepts Remaining : \(conceptArray.count)"
        timerCount = 31
        self.view.backgroundColor = UIColor.yellowColor()
    }
    
    @IBAction func tappedBtnNext(sender: AnyObject) {
        rando = Int(random() % conceptArray.count)
        self.lblConceptToKnow.text = conceptArray[rando]
        conceptArray.removeAtIndex(rando)
        self.lblRemainingConceptCount.text = "Concepts Remaining : \(conceptArray.count)"
        timerCount = 31
        self.view.backgroundColor = UIColor.greenColor()

    }

}

