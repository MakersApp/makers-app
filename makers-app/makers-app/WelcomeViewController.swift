//
//  Scene4ViewController.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class WelcomeViewController: MakersAppViewController {
    
    @IBOutlet var lineMarkers: [UIButton]!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var hostName: UILabel!
    @IBOutlet weak var headView: UIImageView!
    
    let visitManager = VisitManager()
    
    override func viewDidLoad() {
        setUpLineDrawer(lineMarkers)
        addGreyBorder(welcomeLabel)
        hideHeaderImage(headerImage)
        visitManager.checkIfCheckedIn(updateDisplay)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hitBeaconAgain", name: "hit beacon again", object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        drawLines(lineMarkers, durationInSeconds: 5.5)
    }
    
    func updateDisplay(data:NSDictionary){
        let hostname: String = data["team_member"] as! String
        hostName.text = hostname
        headView.image = UIImage(named: (hostname))
    }
    
    func hitBeaconAgain(){
        performSegueWithIdentifier("questionaire", sender: nil)
    }
    
}