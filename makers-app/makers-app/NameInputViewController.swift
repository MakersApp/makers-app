//
//  ViewController.swift
//  makers-app
//
//  Created by James Miller on 21/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class NameInputViewController: MakersAppViewController {
    
    @IBOutlet weak var greetingText: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet var lineMarkersOne: [UIButton]!
    @IBOutlet var lineMarkersTwo: [UIButton]!
    let visitManager = VisitManager()
    
    override func viewDidLoad() {
        visitManager.checkIfHasVisit(hasVisitSegue)
        setUpLineDrawer(lineMarkersOne)
        setUpLineDrawer(lineMarkersTwo)
        initialFormatting()
    }
    
    override func viewDidLayoutSubviews() {
        drawLines(lineMarkersOne, durationInSeconds: 2.0)
    }
    
    func initialFormatting(){
        addGreyBorder(greetingText)
        addGreyBorder(nameInput)
        let imageView = UIImage(named: "banner_logo") as UIImage?
        self.navigationItem.titleView = UIImageView(image: imageView)
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
        linesDrawn = false
        drawLines(lineMarkersTwo, durationInSeconds: 3.0)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if var mainViewController = segue.destinationViewController as? StaffSelectViewController {
            mainViewController.userName = nameInput.text
        }
    }
}

