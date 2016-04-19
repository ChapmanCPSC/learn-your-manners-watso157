//
//  ViewController.swift
//  watsonChristopher_iOSAssignment4
//
//  Created by Christopher Watson on 4/18/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var lblLesson: UILabel!
    @IBOutlet weak var imgLessonImg: UIImageView!
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonsTextArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tvListOfLessons.dequeueReusableCellWithIdentifier("lessonCell")! as UITableViewCell
        
        cell.textLabel?.text = self.lessonsTextArray[indexPath.row]
        
        
        return cell
    }
    
    
    
}

