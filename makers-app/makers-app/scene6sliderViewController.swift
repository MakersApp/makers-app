//
//  scene6sliderViewController.swift
//  makers-app
//
//  Created by Milena Stoeva on 5/28/15.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class scene6sliderViewController: UIViewController {

    @IBOutlet var slider6: UISlider!
    @IBOutlet var npsNumber: UILabel!
    
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        
        npsNumber.text = "\(currentValue)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
