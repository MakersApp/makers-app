//
//  BeaconManager.swift
//  makers-app
//
//  Created by James Miller on 24/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation

class BeaconNotifier: NSObject, ESTBeaconManagerDelegate {

    let bManager = ESTBeaconManager()
    var hasArrived = false
    var isAboutToLeave = false
    var hasLeft = false
    
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D"),
        identifier: "MakerBeacon")
    
    override init() {
        super.init()
        bManager.delegate = self
        bManager.avoidUnknownStateBeacons = true
        bManager.startMonitoringForRegion(beaconRegion)
    }
    
    func didEnterRegion() {
        if (!hasArrived) {
            hasArrived = true
            println("User has arrived for the first time")
        } else {
            isAboutToLeave = true
            println("User is about to leave")
        }
    }
    
    func didExitRegion() {
        if (isAboutToLeave) {
            hasLeft = true
            println("User has left :(")
        }
    }
    
}
