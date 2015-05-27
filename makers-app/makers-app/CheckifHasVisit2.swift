//
//  CheckifHasVisit2.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 27/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation
import UIKit
class CheckIfHasVisit {
    init(callBack: (NSDictionary)->()){
        let deviceID = UIDevice.currentDevice().identifierForVendor.UUIDString
        let httpManager = HttpManager()
        httpManager.makeGetRequest("http://makersvisitorapi.herokuapp.com/visits?phone_id=\(deviceID)", callBack: callBack)
    }
    
}