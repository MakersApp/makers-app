//
//  MakersCustomSegue.swift
//  makers-app
//
//  Created by James Miller on 25/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class MakersCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        var firstVCView = self.sourceViewController.view as UIView!
        var secondVCView = self.destinationViewController.view as UIView!
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        secondVCView.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, -screenHeight)
            
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController,
                    animated: false,
                    completion: nil)
        }
    }
   
}
