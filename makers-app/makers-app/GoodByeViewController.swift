//
//  GoodByeViewController.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 28/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit
import Foundation

class GoodByeViewController: MakersAppViewController {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet var lineMarkers: [UIButton]!
    @IBOutlet weak var goodbyeLabel: UILabel!
    
    override func viewDidLoad() {
        setUpLineDrawer(lineMarkers)
        addGreyBorder(goodbyeLabel)
    }
    
    override func viewDidLayoutSubviews() {
        drawLines(lineMarkers, durationInSeconds: 3.5)
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
    
}
