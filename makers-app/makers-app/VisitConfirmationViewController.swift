//
//  OkViewController.swift
//  makers-app
//
//  Created by James Miller on 23/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class VisitConfirmationViewController: MakersAppViewController {
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet var lineMarkers: [UIButton]!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var hostName: UILabel!
    @IBOutlet weak var hostHead: UIImageView!
    
    var userName: String!
    var teamMember: String!
    let visitManager = VisitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visitManager.checkIfHasVisit(displayData)
        setUpLineDrawer(lineMarkers)
        initialFormatting()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hitbeacon", name: "beacon has been hit", object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        drawLines(lineMarkers, durationInSeconds: 6.0)
    }
    
    func initialFormatting(){
        hideHeaderImage(headerImage)
        addGreyBorder(userNameLabel)
    }
    
    func displayData(data:NSDictionary){
        displayUserName(data["username"] as! String)
        displayHost(data["team_member"] as! String)
    }
    
    func displayUserName(nameString:String){
        userNameLabel.text = "Thanks, \(nameString)!"
    }
    
    func displayHost(hostNameString:String){
        if hostHasName(hostNameString) {
            hostName.text = hostNameString
        } else {
            hostName.hidden = true
        }
        hostHead.image = UIImage(named:(hostNameString))
    }
    
    func hostHasName(hostNameString:String) -> Bool{
        return hostNameString != "Other" && hostNameString != "Event"
    }
    
    func hitbeacon(){
        performSegueWithIdentifier("hashVisitAndBeacon", sender: nil)
    }
    
}
