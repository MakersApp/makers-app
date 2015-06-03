////
////  scene6sliderViewController.swift
////  makers-app
////
////  Created by Milena Stoeva on 5/28/15.
////  Copyright (c) 2015 MakersApp. All rights reserved.
////
//
//import UIKit
//
//class Scene6sliderViewController: MakersAppViewController {
//
//    @IBOutlet var slider6: UISlider!
//    @IBOutlet var npsNumber: UILabel!
//    @IBOutlet weak var headerImage: UIImageView!
//    @IBOutlet var lineMarkers: [UIButton]!
//    @IBOutlet weak var visitToday: UILabel!
//
//    var question: String!
//    var email: String!
//    var joinMailingList: Bool!
//    var currentNPS: Int = 0 {
//        didSet(newValue) {
//            npsNumber.text = "\(newValue)"
//        }
//    }
//    
//    @IBAction func sliderValueChanged(sender: UISlider) {
//        currentNPS = Int(sender.value)
//    }
//    
//    override func viewDidLoad() {
//        currentNPS = 5
//        setUpLineDrawer(lineMarkers)
//        addGreyBorder(visitToday)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        drawLines(lineMarkers, durationInSeconds: 5.0)
//    }
//
//    @IBAction func submitForm(sender: UIButton) {
//        let nps = (sender.currentTitle! == "NEXT" ? "\(currentNPS)" : "skipped")
//        FormSubmission(email: email, nps: nps, question: question, joinMailingList: joinMailingList)
//        performSegueWithIdentifier("question2segue", sender: nil)
//    }
//
//}
