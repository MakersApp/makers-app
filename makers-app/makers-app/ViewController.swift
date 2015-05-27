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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CheckIfHasVisit(callBack: hasVisitSegue)
    }
    
    func hasVisitSegue(data:NSDictionary){
        performSegueWithIdentifier("hasAVisit", sender: nil)
    }
    
    @IBAction func submitButton() {
        NewUser(name: nameInput.text, callBack: processResponse)
    }
    
    func processResponse(responseData: NSDictionary) {
        performSegueWithIdentifier("showWelcomePage", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if var mainViewController = segue.destinationViewController as? MainViewController {
            mainViewController.userName = nameInput.text
        }
    }
}

