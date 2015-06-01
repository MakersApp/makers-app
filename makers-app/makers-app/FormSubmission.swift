//
//  FormSubmission.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 01/06/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation
import UIKit

class FormSubmission {
    init(email:String, nps:String, question:String, joinMailingList:Bool){
        let deviceID = UIDevice.currentDevice().identifierForVendor.UUIDString
        let parameters = ["phoneID":deviceID, "email":email, "nps":nps, "question":question, "joinMailingList": "\(joinMailingList)"]
        let httpManager = HttpManager()
        httpManager.makePostRequest("http://makersvisitorapi.herokuapp.com/feedback", params: parameters, callBack: nil)
    }
}