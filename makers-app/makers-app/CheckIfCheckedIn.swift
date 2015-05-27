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
    
    init(deviceID:String){
        let device_id = deviceID
        let address: String = "http://makersvisitorapi.herokuapp.com/visits?phone_id=\(deviceID)"
        println(address)
        let httpManager = HttpManager()
        httpManager.makeGetRequest(address, callBack: CheckedInCallBack)
    }
    
    func CheckedInCallBack(data:NSDictionary){
        println("checked in call back")
        // temp putting scenechange here
       
        CheckIn(deviceID:device_id)
        if data == "not checked in" {
            // check 'em in
            CheckIn(deviceID:device_id)
        
        } else if data == "already checked in" {
            //redirect to the questionaire
        } else {
            // error!! panic!!!!
        }
    
    }

}