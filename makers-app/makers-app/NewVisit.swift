//
//  NewVisit.swift
//  makers-app
//
//  Created by Richard Lynch 16 on 26/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation
import UIKit
class NewVisit {
    init(team_memeber:String, callBack:(NSDictionary)->()){
        let deviceID = UIDevice.currentDevice().identifierForVendor.UUIDString
        let address: String = "https://makersvisitorapi.herokuapp.com/visits"
        let httpManager = HttpManager()
        let paramaeters = ["phone_id":deviceID, "team_memeber": team_memeber]
        httpManager.makePostRequest(address, params: paramaeters, callBack: callBack)
    }
}