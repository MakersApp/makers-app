//
//  Scene4ViewController.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class Scene4ViewController: UIViewController {
    
    @IBOutlet var lineMarkers: [UIButton]!
    var lineDrawer: LineDrawer!
    var linesDrawn = false

    @IBOutlet weak var headerImage: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lineDrawer = LineDrawer(passedCtrl: self)
        lineDrawer.processMarkers(lineMarkers)
        welcomeLabel.layer.borderWidth = 2
        welcomeLabel.layer.borderColor = UIColor.lightGrayColor().CGColor

        println("in Scene4ViewController")
        CheckIfCheckedIn(checkinCallback: updateDisplay)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hitbeaconagain", name: "hit beacon again", object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if linesDrawn == false {
            lineDrawer.drawLines(lineMarkers, durationInSeconds: 5.5)
            linesDrawn = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var hostName: UILabel!
    @IBOutlet weak var headView: UIImageView!
    func updateDisplay(data:NSDictionary){
        let hostname: String = data["team_member"] as! String
        hostName.text = hostname
        headView.image = UIImage(named: (hostname))
        
    }
    
    override func viewDidAppear(animated: Bool) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("showHeader"), userInfo: nil, repeats: true)
    }
    
    func showHeader() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.headerImage.alpha = 1.0
            }, completion: nil)
    }
    
    func hitbeaconagain(){
        performSegueWithIdentifier("questionaire", sender: nil)
    }


}
