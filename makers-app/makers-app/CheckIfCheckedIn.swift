//
//  CheckIfCheckedIn.swift
//  makers-app
//
//  Created by Richard Lynch on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation
import UIKit

class CheckIfCheckedIn {
    var device_id: String = ""
    var checkinCallbackToExecute:(NSDictionary)->()
    
    init(checkinCallback:(NSDictionary)->()){
        checkinCallbackToExecute = checkinCallback
        let deviceID = UIDevice.currentDevice().identifierForVendor.UUIDString
        let address: String = "http://makersvisitorapi.herokuapp.com/visits?phone_id=\(deviceID)"
        println(address)
        let httpManager = HttpManager()
        httpManager.makeGetRequest(address, callBack: CheckedInCallBack)
    }
    
    func CheckedInCallBack(data:NSDictionary){
        println("checked in call back")
        println(data["checkedin"])
        println(data["username"])
        
        checkinCallbackToExecute(data)
        
        if data["checkedin"] as! Int == 0 {
            println("in if block")
            CheckIn()
        }    
    }

}