//
//  MakersAppViewController.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 01/06/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class MakersAppViewController: UIViewController {
    
    var lineDrawer: LineDrawer!
    var linesDrawn = false
    var viewHeaderImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func drawLines(lineMarkers:[UIButton], durationInSeconds:Double){
        if linesDrawn == false {
        lineDrawer.drawLines(lineMarkers, durationInSeconds: 6.0)
        linesDrawn = true
        }
    }
    
    func setUpLineDrawer(lineMarkers:[UIButton]){
        lineDrawer = LineDrawer(passedCtrl: self)
        lineDrawer.processMarkers(lineMarkers)
    }
    
    func hideHeaderImage(headerImage: UIImageView){
        viewHeaderImage = headerImage
        headerImage.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("showHeader"), userInfo: nil, repeats: true)
    }
    
    func showHeader() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.viewHeaderImage.alpha = 1.0
            }, completion: nil)
    }
    

}
