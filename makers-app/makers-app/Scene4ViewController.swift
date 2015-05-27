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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
