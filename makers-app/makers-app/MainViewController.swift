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
    var httpManager: HttpManager!
    var requestURLBase: String!
    var deviceID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingText.text = "Hi \(userName)!"
        httpManager = HttpManager()
        requestURLBase = httpManager.requestURLBase
        deviceID = httpManager.deviceID
    }

    @IBAction func nameSelect(sender: UIButton) {
        teamMember = sender.currentTitle
        if (teamMember == "I don't know!") {
            teamMember = "unknown"
        }
        httpManager.makePostRequest(requestURLBase, params: ["name": teamMember, "deviceID": deviceID], callBack: processResponse)
    }
    
    func processResponse(responseData: String) {
        performSegueWithIdentifier("showOkPage", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var okViewController = segue.destinationViewController as! OkViewController
        okViewController.userName = userName
        okViewController.teamMember = teamMember
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
