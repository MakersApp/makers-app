//
//  GoodByeViewController.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 28/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit
import Foundation

class GoodByeViewController: UIViewController {

    @IBOutlet weak var headerImage: UIImageView!
    
    @IBOutlet var lineMarkers: [UIButton]!
    var lineDrawer: LineDrawer!
    var linesDrawn = false
    
    @IBOutlet weak var goodbyeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lineDrawer = LineDrawer(passedCtrl: self)
        lineDrawer.processMarkers(lineMarkers)
        goodbyeLabel.layer.borderWidth = 2
        goodbyeLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        


        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if linesDrawn == false {
            lineDrawer.drawLines(lineMarkers, durationInSeconds: 3.5)
            linesDrawn = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("showHeader"), userInfo: nil, repeats: true)
    }
    
    func showHeader() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.headerImage.alpha = 1.0
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func james(sender: UIButton) {
       UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/james-miller")!)
    }
    
    @IBAction func sara(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/saramoohead")!)
    }
    
    @IBAction func milena(sender: UIButton) {
       UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/M1lena")!)
    }
    
    @IBAction func rich(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/rjlynch")!)
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
