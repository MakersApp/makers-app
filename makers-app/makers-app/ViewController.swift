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
    let requestURLBase = "http://makersvisitorapi.herokuapp.com/users/"
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButton() {
        println(nameInput.text)
        let httpManager = HttpManager()
        httpManager.makePostRequest(requestURLBase, params: ["name": nameInput.text], callBack: processResponse)
    }
    
    func processResponse(responseData: String) {
        performSegueWithIdentifier("showWelcomePage", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var mainViewController = segue.destinationViewController as! MainViewController
        mainViewController.userName = nameInput.text
    }
}

