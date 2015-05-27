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
//        userNameLabel.text = "Thanks, \(userName)!"
//        if (teamMember != "unknown") {
//            teamNameLabel.text = "We will let \(teamMember) know when you arrive."
//        } else {
//            teamNameLabel.text = "We will notify a member of staff when you arrive."
//        }
//        let beaconNotifier = BeaconNotifier()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
