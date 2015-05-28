//
//  lineDrawing.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 28/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import UIKit
import QuartzCore

import Foundation

class LineDrawer {
    
    var viewCtrl: UIViewController
    var markersOnView: [UIButton] = []
    
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
    
    func processMarkers(markers: [UIButton]) {
        for marker in markers {
            marker.hidden = true
        }
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
        lineToDraw.lineWidth = 2.0
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