//
//  scene6sliderViewController.swift
//  makers-app
//
//  Created by Milena Stoeva on 5/28/15.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit

class Scene6sliderViewController: UIViewController {

    @IBOutlet var slider6: UISlider!
    @IBOutlet var npsNumber: UILabel!
    var currentValue: Int!
    var question: String!
    var email: String!
    var joinMailingList: Bool!
    
    
    @IBOutlet weak var headerImage: UIImageView!
    
    @IBOutlet var lineMarkers: [UIButton]!
    var lineDrawer: LineDrawer!
    var linesDrawn = false
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        currentValue = Int(sender.value)
        
        npsNumber.text = "\(currentValue)"
    }
    @IBOutlet weak var visitToday: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lineDrawer = LineDrawer(passedCtrl: self)
        lineDrawer.processMarkers(lineMarkers)
        visitToday.layer.borderWidth = 2
        visitToday.layer.borderColor = UIColor.lightGrayColor().CGColor

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if linesDrawn == false {
            lineDrawer.drawLines(lineMarkers, durationInSeconds: 5.0)
            linesDrawn = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func noThanks(sender: UIButton) {
        let deviceID = UIDevice.currentDevice().identifierForVendor.UUIDString
        let httpManager = HttpManager()
        let parameters:[String:String] = ["phoneID":"\(deviceID)", "email":"\(email)", "nps":"skipped", "question":"\(question)", "joinMailingList": "\(joinMailingList)"]
        
        httpManager.makePostRequest("http://makersvisitorapi.herokuapp.com/feedback", params: parameters, callBack: callbackfunc)
        performSegueWithIdentifier("question2segue", sender: nil)
    }

    @IBAction func nextButton(sender: UIButton) {
        let deviceID = UIDevice.currentDevice().identifierForVendor.UUIDString
        let httpManager = HttpManager()
        let parameters:[String:String] = ["phoneID":"\(deviceID)", "email":"\(email)", "nps":"\(currentValue)", "question":"\(question)", "joinMailingList": "\(joinMailingList)"]
        
        httpManager.makePostRequest("http://makersvisitorapi.herokuapp.com/feedback", params: parameters, callBack: callbackfunc)
        performSegueWithIdentifier("question2segue", sender: nil)
        }
    
    func callbackfunc(data:NSDictionary){
   
    }
    
    override func viewDidAppear(animated: Bool) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("showHeader"), userInfo: nil, repeats: true)
    }
    
    func showHeader() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.headerImage.alpha = 1.0
            }, completion: nil)
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
