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
    var userName: String!
    var teamMember: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingText.text = "Hi \(userName)!"
    }

    @IBAction func nameSelect(sender: UIButton) {
        teamMember = sender.currentTitle
        if (teamMember == "I don't know!") {
            teamMember = "unknown"
        }
        NewVisit(team_memeber:teamMember, callBack:processResponse)
    }
    
    func processResponse(responseData: NSDictionary) {
        performSegueWithIdentifier("showOkPage", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var okViewController = segue.destinationViewController as! OkViewController
        okViewController.userName = userName
        okViewController.teamMember = teamMember
    }
}
