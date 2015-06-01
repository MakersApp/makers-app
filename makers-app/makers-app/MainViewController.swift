//
//  MainViewController.swift
//  makers-app
//
//  Created by James Miller on 21/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class MainViewController: MakersAppViewController {
    
    @IBOutlet weak var greetingText: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet var lineMarkers: [UIButton]!
    
    var userName: String!
    var teamMember: String!
    
    override func viewDidLoad() {
        setUpLineDrawer(lineMarkers)
        initialFormatting()
    }
    
    func initialFormatting(){
        hideHeaderImage(headerImage)
        greetingText.text = "Who are you meeting?"
        addGreyBorder(greetingText)
    }
    
    override func viewDidLayoutSubviews() {
        drawLines(lineMarkers, durationInSeconds: 7.0)
    }

    @IBAction func nameSelect(sender: UIButton) {
        NewVisit(team_member: sender.currentTitle!, callBack:segueToShowOkPage)
    }
    
    func segueToShowOkPage(responseData: NSDictionary) {
        performSegueWithIdentifier("showOkPage", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var okViewController = segue.destinationViewController as! OkViewController
        okViewController.userName = userName
        okViewController.teamMember = teamMember
    }
}
