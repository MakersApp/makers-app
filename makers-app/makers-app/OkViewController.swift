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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.layer.borderWidth = 2
        userNameLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        userNameLabel.text = "Thanks, \(userName)!"
        if (teamMember != "unknown") {
            teamNameLabel.text = "We will let \(teamMember) know when you arrive."
        } else {
            teamNameLabel.text = "We will notify a member of staff when you arrive."
        }
    }
}
