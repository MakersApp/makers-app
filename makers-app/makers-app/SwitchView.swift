//
//  SwitchView.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation
import UIKit

class SwitchView: UIViewController {
    
//    performSegueWithIdentifier(identifier:"Scene4ViewController", sender: nil)
    func switchview(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let resultViewController = storyBoard.instantiateViewControllerWithIdentifier("Scene4ViewController") as! Scene4ViewController
        
        self.presentViewController(resultViewController, animated:true, completion:nil)
    }
}