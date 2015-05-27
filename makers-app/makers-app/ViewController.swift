//
//  ViewController.swift
//  makers-app
//
//  Created by James Miller on 21/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingText: UILabel!
    @IBOutlet weak var nameInput: UITextField!
//    @IBOutlet var headerBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingText.layer.borderWidth = 2
        greetingText.layer.borderColor = UIColor.lightGrayColor().CGColor
        nameInput.layer.borderWidth = 2
        nameInput.layer.borderColor = UIColor.lightGrayColor().CGColor
        let imageView = UIImage(named: "banner_logo") as UIImage?
        
        self.navigationItem.titleView = UIImageView(image: imageView)
    }
    
    @IBAction func submitButton() {
//        SceneChangeHandler().ChangeScene()
        NewUser(name: nameInput.text, callBack: processResponse)
    }
    
    func processResponse(responseData: NSDictionary) {
        performSegueWithIdentifier("showWelcomePage", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var mainViewController = segue.destinationViewController as! MainViewController
        mainViewController.userName = nameInput.text
    }
}

