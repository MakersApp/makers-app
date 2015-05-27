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
  
  func makeGetRequest(address: String, callBack: (data: NSDictionary)->()){
    Alamofire.request(.GET, address)
      .responseJSON { (_, _, JSON, _) in
        if let object = JSON as? NSDictionary {
          callBack(data: object)
        } 
    }
  }

  func makePostRequest(address: String, params: [String: String], callBack: (data: NSDictionary)->()){
      Alamofire.request(.POST, address, parameters: params)
          .responseJSON { (_, _, JSON, _) in
              if let object = JSON as? NSDictionary {
                println("hi from rich and james!!")
                  callBack(data: object)
              }
      }
  }
  
  func makePatchRequest(address: String, params: [String: String], callBack: (data: NSDictionary)->()){
      Alamofire.request(.PATCH, address, parameters: params)
        .responseJSON { (_, _, JSON, _) in
          if let object = JSON as? NSDictionary {
            callBack(data: object)
          }
      }
  }
}