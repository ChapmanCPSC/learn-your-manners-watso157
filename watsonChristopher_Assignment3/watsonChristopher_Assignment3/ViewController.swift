//
//  ViewController.swift
//  watsonChristopher_Assignment3
//
//  Created by Christopher Watson on 3/14/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

extension String {
    var isFloat : Float? {
        return Float(self)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var lblTipToGive: UILabel!
    @IBOutlet weak var lblCurrentRating: UILabel!
    @IBOutlet weak var lblBillAmount: UITextField!
    @IBOutlet weak var sliderRating: UISlider!
    
    var stringFromText = ""
    var billAmount = Float(0.00)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func movedSlider(sender: UISlider) {
    
        self.lblCurrentRating.text = String(format: "%@%ld", "Rating: ", Int(sender.value))
        if (!self.lblBillAmount.hasText()){
            self.lblTipToGive.textColor = UIColor.redColor()
            self.lblTipToGive.text = "Please enter Bill Amount"
        }
        else if (self.lblBillAmount.hasText()){
            if ((self.lblBillAmount.text!.isFloat) != nil){
                self.lblTipToGive.textColor = UIColor(colorLiteralRed: 100/255.0, green: 200/255.0, blue: 120/255.0, alpha: 1.0)
                doMathToGiveTip(Int(sender.value))
                
            }
            else {
                self.lblTipToGive.textColor = UIColor.redColor()
                self.lblTipToGive.text = "Please enter Valid Bill Amount"
            }
        }
    }
    
    func doMathToGiveTip(currentRating : Int){

        stringFromText = self.lblBillAmount.text!
        billAmount = Float(stringFromText)!

        NSLog("Current Rating is: %ld", currentRating)
        
        if (currentRating < 1){
            self.lblTipToGive.text = "Please Select a Rating"
        }
        else if ((currentRating >= 1) && (currentRating <= 3)){
            self.lblTipToGive.text = String(format: "$%.2f", (billAmount * 0.10))
        }
        else if ((currentRating >= 4) && (currentRating <= 5)){
            self.lblTipToGive.text = String(format: "$%.2f", (billAmount * 0.13))
        }
        else if ((currentRating >= 6) && (currentRating <= 7)){
            self.lblTipToGive.text = String(format: "$%.2f", (billAmount * 0.15))
        }
        else if ((currentRating >= 8) && (currentRating <= 9)){
            self.lblTipToGive.text = String(format: "$%.2f", (billAmount * 0.20))
        }
        else if (currentRating == 10){
            self.lblTipToGive.text = String(format: "$%.2f", (billAmount * 0.25))
        }
        
        
    }


}

