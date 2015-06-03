//
//  VisitManager.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 02/06/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation
import UIKit

class VisitManager{
    
    var address: String!
    var checkinCallbackToExecute:((NSDictionary)->())!
    let deviceID = UIDevice.currentDevice().identifierForVendor.UUIDString
    let httpManager = HttpManager()
    let rootURL = "https://makersvisitorapi.herokuapp.com/"
    
    func newUser(name:String, callBack:(NSDictionary)->()){
        address = rootURL + "users"
        let parameters = ["phone_id":deviceID, "name": name]
        httpManager.makePostRequest(address, params: parameters, callBack: callBack)
    }
   
    func newVisit(teamMember:String, callBack:(NSDictionary)->()){
        address = rootURL + "visits"
        let parameters = ["phone_id":deviceID, "team_member": teamMember]
        httpManager.makePostRequest(address, params: parameters, callBack: callBack)
    }
    
   func checkIfHasVisit(callBack: (NSDictionary)->()){
        httpManager.makeGetRequest("http://makersvisitorapi.herokuapp.com/visits?phone_id=\(deviceID)", callBack: callBack)
    }
    
    func checkIfCheckedIn(checkinCallback:(NSDictionary)->()){
        checkinCallbackToExecute = checkinCallback
        address = rootURL + "visits?phone_id=\(deviceID)"
        httpManager.makeGetRequest(address, callBack: checkedInCallBack)
    }
    
    func checkedInCallBack(data:NSDictionary){
        checkinCallbackToExecute(data)
        if data["checkedin"] as! Int == 0 {
            println("in if block")
            checkIn()
        }    
    }

    func checkIn(){
        let parameters: [String:String] = ["phone_id":deviceID]
        httpManager.makePatchRequest("http://makersvisitorapi.herokuapp.com/checkin", params: parameters, callBack: nil)
    }
}
