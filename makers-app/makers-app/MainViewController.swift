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
        // Do any additional setup after loading the view.
    }
    

    @IBAction func nameSelect(sender: UIButton) {
        teamMember = sender.currentTitle
        if (teamMember == "I don't know!") {
            teamMember = "unknown"
        }
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
