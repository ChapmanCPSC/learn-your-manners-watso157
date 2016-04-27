//
//  ViewController.swift
//  watsonChristopher_iOSAssignment4
//
//  Created by Christopher Watson on 4/18/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var lblLesson: UILabel!
    @IBOutlet weak var imgLessonImg: UIImageView!
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnSendSummary: UIButton!
    @IBOutlet weak var viewDisplay: UIView!
    @IBOutlet weak var tvListOfLessons: UITableView!
    var lessonsImgDict : [String: String] = [
        "Greeting People": "hello",
        "Thank you" :"thank",
        "Being on time" :"time",
        "Patience" : "wait",
        "Asking":"ask",
        "Nice Words":"swear",
        "Be a friend":"friend",
        "Sharing":"share",
        "Good Listening" : "listen"
    ]
    var lessonsCompletedArray : [String] = []
    var lessonsTextDict : [String: String] = [
        "Greeting People" : "Sey hello to everyone with a smile.",
        "Thank you" : "If someone helps you, say thank you to let them know they are appreciated, big or small!",
        "Being on time" : "Being on time is considered polite and respectful",
        "Patience" : "Wait your turn to ensure everyon gets to play.",
        "Asking" : "Ask for permission before acting out of turn",
        "Nice Words" : "Friends are made with friendly words!",
        "Be a friend" : "Be a friend that you would want to have",
        "Sharing" : "Sharing is caring",
        "Good Listening" : "Did you read all that I said? Good! You are a good listener!"
    ]
    
    var lessonsTextArray : [String] = [
    "Greeting People", "Thank you", "Being on time", "Patience", "Asking", "Nice Words", "Be a friend", "Sharing", "Good Listening"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblLesson.text = ""
        self.tvListOfLessons.registerClass(UITableViewCell.self, forCellReuseIdentifier: "lessonCell")
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let email = userDefaults.stringForKey("email"){
            self.btnSendSummary.hidden = false
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedSendSummary(sender: AnyObject) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        let email : String = userDefaults.stringForKey("email")!
        composeVC.setToRecipients([email])
        composeVC.setSubject("Manners Completion!")
        
        var emailBody = ""
        if lessonsCompletedArray.isEmpty{
            emailBody += "No lessons completed yet"
        }
        else {
            emailBody += "Lessons completed:"
            for i in lessonsCompletedArray{
                emailBody += "\n"
                emailBody += i
            }
        }
        composeVC.setMessageBody(emailBody, isHTML: false)
        self.presentViewController(composeVC, animated: true, completion: nil)
        
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController,
        didFinishWithResult result: MFMailComposeResult, error: NSError?) {
            controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        
        //Add imageView to cell
        self.imgLessonImg.image = UIImage(named: self.lessonsImgDict[self.lessonsTextArray[indexPath.row]]!)
        
        self.lblLesson?.text = self.lessonsTextDict[(selectedCell.textLabel?.text)!]
        
        //Add imageView to cell
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: (selectedCell.frame.size.height/2)-8, width: 15, height: 15)
        imageView.image = UIImage(named: "green")
        selectedCell.addSubview(imageView)
        
        lessonsCompletedArray.append((selectedCell.textLabel?.text)!)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonsTextArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tvListOfLessons.dequeueReusableCellWithIdentifier("lessonCell")! as UITableViewCell
        
        cell.textLabel?.text = self.lessonsTextArray[indexPath.row]
        
        
        return cell
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }
    
    
}

