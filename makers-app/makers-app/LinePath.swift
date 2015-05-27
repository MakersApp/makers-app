//
//  LinePath.swift
//  makers-app
//
//  Created by James Miller on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit
import QuartzCore

import Foundation

class LineDrawer {
    
    var viewCtrl: UIViewController
    var markersOnView: [UIButton] = []
    let screenBounds: CGRect = UIScreen.mainScreen().bounds
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0

    init(passedCtrl: UIViewController) {
        viewCtrl = passedCtrl

    }
    
    func drawLines(markers: [UIButton], durationInSeconds: Double = 7.0) {
        markersOnView = markers
        markersOnView = sortedMarkers()
        for marker in markersOnView {
            marker.hidden = true
        }
        animateLineDrawing(duration: durationInSeconds)
    }
    
    func sortedMarkers() -> [UIButton] {
        let sortedMarkers = markersOnView.sorted { $0.accessibilityLabel < $1.accessibilityLabel }
        return sortedMarkers
    }
    
    func printCenters(markers: [UIButton]) {
        for marker in markers {
            println(marker.center)
        }
    }
    
    func line() -> UIBezierPath {
        screenWidth = screenBounds.width
        screenHeight = screenBounds.height
        var linePath = UIBezierPath()
        linePath.moveToPoint(markersOnView[0].center)
        for i in 1...(markersOnView.count - 1) {
            linePath.addLineToPoint(markersOnView[i].center)
        }
        return linePath
    }
    
    func animateLineDrawing(duration: Double = 7.0) {
        let lineToDraw = CAShapeLayer()
        lineToDraw.path = line().CGPath
        lineToDraw.lineWidth = 1.0
        lineToDraw.strokeColor = UIColor.lightGrayColor().CGColor
        lineToDraw.fillColor = UIColor.clearColor().CGColor
        
        viewCtrl.view.layer.insertSublayer(lineToDraw, atIndex: 0)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0.0
        animation.toValue = 1.0
        
        lineToDraw.addAnimation(animation, forKey: "animate stroke end animation")
        
    }
    
    
    
}
