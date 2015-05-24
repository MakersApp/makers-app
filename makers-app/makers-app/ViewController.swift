//
//  ViewController.swift
//  makers-app
//
//  Created by James Miller on 21/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    var httpManager: HttpManager!
    var requestURLBase: String!
    var deviceID: String!
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        httpManager = HttpManager()
        requestURLBase = httpManager.requestURLBase
        deviceID = httpManager.deviceID
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

