//
//  HttpManager.swift
//  makers-app
//
//  Created by James Miller on 22/05/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation
import Alamofire

class HttpManager {
    
    let requestURLBase = "http://makersvisitorapi.herokuapp.com/users/"
    let deviceID = UIDevice.currentDevice().identifierForVendor.UUIDString
    
    func makePostRequest(address: String, params: [String: String], callBack: (data: String)->()){
//        Alamofire.request(.POST, address, parameters: params)
//            .responseJSON { (_, _, JSON, _) in
//                if let object = JSON as? NSDictionary {
//                    var dataStr = object["name"] as! String
//                    callBack(data: dataStr)
//                }
        callBack(data: "name")
//        }
    }
    
}