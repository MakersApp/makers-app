//
//  ViewController.swift
//  makers-app
//
//  Created by James Miller on 21/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lineDrawer: LineDrawer!
    var linesDrawn = false

    @IBOutlet weak var greetingText: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var headerImage: UIImageView!
    
    @IBOutlet var lineMarkersOne: [UIButton]!
    @IBOutlet var lineMarkersTwo: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineDrawer = LineDrawer(passedCtrl: self)
        lineDrawer.processMarkers(lineMarkersOne)
        lineDrawer.processMarkers(lineMarkersTwo)
        greetingText.layer.borderWidth = 2
        greetingText.layer.borderColor = UIColor.lightGrayColor().CGColor
        nameInput.layer.borderWidth = 2
        nameInput.layer.borderColor = UIColor.lightGrayColor().CGColor
        let imageView = UIImage(named: "banner_logo") as UIImage?
        self.navigationItem.titleView = UIImageView(image: imageView)
        CheckIfHasVisit(callBack: hasVisitSegue)
    }
    
    override func viewDidLayoutSubviews() {
        if linesDrawn == false {
            lineDrawer.drawLines(lineMarkersOne, durationInSeconds: 1.7)
            linesDrawn = true
        }
    }
    
    func hasVisitSegue(data:NSDictionary){
        performSegueWithIdentifier("hasAVisit", sender: nil)
    }
    
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func submitButton() {
        NewUser(name: nameInput.text, callBack: processResponse)
    }
    
    func processResponse(responseData: NSDictionary) {
        performSegueWithIdentifier("showWelcomePage", sender: nil)
    }

    @IBAction func startTyping() {
        lineDrawer.drawLines(lineMarkersTwo, durationInSeconds: 3.0)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//            self.headerImage.alpha = 0.0
//            }, completion: nil)
        if var mainViewController = segue.destinationViewController as? MainViewController {
            mainViewController.userName = nameInput.text
        }
    }
}

