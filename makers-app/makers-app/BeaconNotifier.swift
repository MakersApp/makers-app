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
    }
    
// comment in startRaning and the beaconManager method with didRangeBeacons arg to use ranging.
    func requestPermissions() {
        bManager.requestAlwaysAuthorization()
        bManager.avoidUnknownStateBeacons = true
        bManager.startMonitoringForRegion(beaconRegion)
//        bManager.startRangingBeaconsInRegion(beaconRegion)
    }
    
    func beaconManager(manager: AnyObject!, didEnterRegion region: CLBeaconRegion!) {
        println("did enter region")
    }
    
    func beaconManager(manager: AnyObject!, didDetermineState state: CLRegionState, forRegion region: CLBeaconRegion!) {
            println("state",state,"region", region)
    }

//    func beaconManager(manager: AnyObject!,
//        didRangeBeacons beacons: [AnyObject]!,
//        inRegion region: CLBeaconRegion!) {
//            if let nearestBeacon = beacons.first as? CLBeacon {
//                println("in range")
//            }
//    }
    

}
