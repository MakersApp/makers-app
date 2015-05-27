//
//  newCheckIn.swift
//  makers-app
//
//  Created by Richard Lynch on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//
import UIKit
import Foundation

class CheckIn{


    init(deviceID:String){
        let parameters: [String:String] = ["phone_id":deviceID]
        let httpManager = HttpManager()
        httpManager.makePatchRequest("http://makersvisitorapi.herokuapp.com/checkin", params: parameters, callBack: checkInCallBack)
    }
    
    func checkInCallBack(data:NSDictionary){
        println("in check in call back")
        
  
    }

}