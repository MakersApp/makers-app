////
////  Question1ViewController.swift
////  makers-app
////
////  Created by Makers Laptop 16 on 28/05/2015.
////  Copyright (c) 2015 MakersApp. All rights reserved.
////
//
//import UIKit
//
//class Question1ViewController: MakersAppViewController, UITextViewDelegate {
//    
//    @IBOutlet weak var questionForm: UITextView!
//    @IBOutlet weak var headerImage: UIImageView!
//    @IBOutlet var lineMarkers: [UIButton]!
//    @IBOutlet weak var emailForm: UITextField!
//    @IBOutlet weak var enjoyedVisit: UILabel!
//    
//    var joinMailingList: Bool = false
//    var textHasBeenEdited = false
//    
//    override func viewDidLoad() {
//        questionForm.delegate = self
//        setUpLineDrawer(lineMarkers)
//        addGreyBorder(enjoyedVisit)
//    }
//    
//    func textViewDidBeginEditing(textView: UITextView) {
//        if textHasBeenEdited == false {
//            textView.text = ""
//            textHasBeenEdited = true
//        }
//    }
//    
//    override func viewDidLayoutSubviews() {
//        drawLines(lineMarkers, durationInSeconds: 6.5)
//    }
//    
//    @IBAction func nextButton(sender: UIButton) {
//        performSegueWithIdentifier("question1", sender: nil)
//    }
//    
//    @IBAction func screenTap(sender: UITapGestureRecognizer) {
//        self.view.endEditing(true)
//    }
//    
//    @IBAction func joinMailingListButton(sender: UIButton) {
//        joinMailingList = true
//    }
//    
//    @IBAction func noThanksButton(sender: UIButton) {
//        performSegueWithIdentifier("nothanksSegue", sender: nil)
//    }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "question1" {
//            var scene6sliderViewController = segue.destinationViewController as! Scene6sliderViewController
//            scene6sliderViewController.email = emailForm.text
//            scene6sliderViewController.question = questionForm.text
//            scene6sliderViewController.joinMailingList = joinMailingList
//        }
//    }
//
//}
