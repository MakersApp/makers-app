//
//  OkViewController.swift
//  makers-app
//
//  Created by James Miller on 23/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class OkViewController: UIViewController {
    
    var lineDrawer: LineDrawer!
    var linesDrawn = false
    
    @IBOutlet weak var headerImage: UIImageView!
    var userName: String!
    var teamMember: String!
    
    @IBOutlet var lineMarkers: [UIButton]!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var hostName: UILabel!
    
    @IBOutlet weak var hostHead: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerImage.alpha = 0.0
        lineDrawer = LineDrawer(passedCtrl: self)
        lineDrawer.processMarkers(lineMarkers)
        userNameLabel.layer.borderWidth = 2
        userNameLabel.layer.borderColor = UIColor.lightGrayColor().CGColor

        userNameLabel.layer.borderWidth = 2
        userNameLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hitbeacon", name: "some string", object: nil)
        
        CheckIfHasVisit(callBack: getTeamMember)
    }
    
    override func viewDidLayoutSubviews() {
        if linesDrawn == false {
        lineDrawer.drawLines(lineMarkers, durationInSeconds: 6.0)
            linesDrawn = true
        }
    }
    
    func getTeamMember(data:NSDictionary){
        let namestr = data["username"] as! String
        userNameLabel.text = "Thanks, \(namestr)!"
        
        let hostNamestr = data["team_member"] as! String
        if hostNamestr == "Other" || hostNamestr == "Event" {
            hostName.hidden = true
        } else {
            hostName.text = hostNamestr
        }
        
        hostHead.image =  UIImage(named: (hostNamestr))
    }
    
    override func viewDidAppear(animated: Bool) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("showHeader"), userInfo: nil, repeats: true)
    }
    
    func showHeader() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.headerImage.alpha = 1.0
            }, completion: nil)
    }
    
    func hitbeacon(){
        performSegueWithIdentifier("hashVisitAndBeacon", sender: nil)
    }

}
