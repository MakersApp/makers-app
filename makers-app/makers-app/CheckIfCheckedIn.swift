//
//  CheckIfCheckedIn.swift
//  makers-app
//
//  Created by Richard Lynch on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation

class CheckIfCheckedIn {
    var device_id: String = ""
    
    init(deviceID:String){
        println("check in initialized")
        device_id = deviceID
        let address: String = "http://makersvisitorapi.herokuapp.com/visit?phone_id=\(deviceID)"
        let httpManager = HttpManager()
        httpManager.makeGetRequest(address, callBack: CheckedInCallBack)
    }
    
    func CheckedInCallBack(data:NSDictionary){
        println("checked in callback")
        println(data)
        
        if data == "not checked in" {
            // check 'em in
            CheckIn(deviceID:device_id)
        
        } else if data == "already checked in" {
        
        } else {
            // error!! panic!!!!
        }
    
    }

}