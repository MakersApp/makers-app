//
//  MainViewController.swift
//  makers-app
//
//  Created by James Miller on 21/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var greetingText: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet var lineMarkers: [UIButton]!
    
    var userName: String!
    var teamMember: String!
    var lineDrawer: LineDrawer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineDrawer = LineDrawer(passedCtrl: self)
        self.headerImage.alpha = 0.0
        greetingText.text = "Who are you meeting?"
        greetingText.layer.borderWidth = 2
        greetingText.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
    
    override func viewDidLayoutSubviews() {
        lineDrawer.drawLines(lineMarkers, durationInSeconds: 7.0)
    }

    @IBAction func nameSelect(sender: UIButton) {

        teamMember = sender.currentTitle
        println(teamMember)
        if (teamMember == "I don't know!") {
            teamMember = "unknown"
        }
        NewVisit(team_member: teamMember, callBack:processResponse)
    }
    
    func processResponse(responseData: NSDictionary) {
        performSegueWithIdentifier("showOkPage", sender: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("showHeader"), userInfo: nil, repeats: true)
    }
    
    func showHeader() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.headerImage.alpha = 1.0
            }, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var okViewController = segue.destinationViewController as! OkViewController
        okViewController.userName = userName
        okViewController.teamMember = teamMember
    }
}
