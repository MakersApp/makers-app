//
//  ViewController.swift
//  makers-app
//
//  Created by James Miller on 21/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet var markerButtons: [UIButton]!
    
    //@IBOutlet var markerButtons2: [UIButton]!
    
    @IBOutlet weak var nameInput: UITextField!
    var httpManager: HttpManager!
    var requestURLBase: String!
    var deviceID: String!
    var lineDrawer: LineDrawer!
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        httpManager = HttpManager()
        requestURLBase = httpManager.requestURLBase
        deviceID = httpManager.deviceID
        lineDrawer = LineDrawer(passedCtrl: self)
    }
    
    override func viewDidLayoutSubviews() {
        lineDrawer.drawLines(markerButtons, durationInSeconds: 3.0)
    }
    
    @IBAction func submitButton() {
        httpManager.makePostRequest(requestURLBase, params: ["name": nameInput.text, "deviceID": deviceID], callBack: processResponse)
    }
    
    func processResponse(responseData: String) {
        performSegueWithIdentifier("showWelcomePage", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var mainViewController = segue.destinationViewController as! MainViewController
        mainViewController.userName = nameInput.text
    }
    
}

