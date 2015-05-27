//
//  Scene4ViewController.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class Scene4ViewController: UIViewController {

//    @IBOutlet weak var hostName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("in Scene4ViewController")
        CheckIfCheckedIn(checkinCallback: updateDisplay)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hitbeaconagain", name: "hit beacon again", object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func changeScene(){
//
//    }
    @IBOutlet weak var hostName: UILabel!
    func updateDisplay(hostname:String){
        hostName.text = hostname
    }
    
    func hitbeaconagain(){
        performSegueWithIdentifier("questionaire", sender: nil)
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
