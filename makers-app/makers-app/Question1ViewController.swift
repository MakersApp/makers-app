//
//  Question1ViewController.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 28/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class Question1ViewController: UIViewController {
    
    @IBOutlet weak var questionForm: UITextView!
    
    @IBOutlet weak var emailForm: UITextField!
    var joinMailingList: Bool = false

    @IBOutlet weak var enjoyedVisit: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        enjoyedVisit.layer.borderWidth = 2
        enjoyedVisit.layer.borderColor = UIColor.lightGrayColor().CGColor


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(sender: UIButton) {
        performSegueWithIdentifier("question1", sender: nil)
    }
    
    @IBAction func screenTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func joinMailingListButton(sender: UIButton) {
        sender.backgroundColor = UIColor.redColor()
        joinMailingList = true
    }
    
    @IBAction func noThanksButton(sender: UIButton) {
        performSegueWithIdentifier("nothanksSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "question1" {
            var scene6sliderViewController = segue.destinationViewController as! Scene6sliderViewController
            scene6sliderViewController.email = emailForm.text
            scene6sliderViewController.question = questionForm.text
            scene6sliderViewController.joinMailingList = joinMailingList
        }
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