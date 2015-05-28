//
//  OkViewController.swift
//  makers-app
//
//  Created by James Miller on 23/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class OkViewController: UIViewController {
    
    var userName: String!
    var teamMember: String!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var hostName: UILabel!
    
    @IBOutlet weak var hostHead: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.layer.borderWidth = 2
        userNameLabel.layer.borderColor = UIColor.lightGrayColor().CGColor

        userNameLabel.layer.borderWidth = 2
        userNameLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hitbeacon", name: "some string", object: nil)
        
        CheckIfHasVisit(callBack: getTeamMember)
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
    
    func hitbeacon(){
        performSegueWithIdentifier("hashVisitAndBeacon", sender: nil)
    }

}
