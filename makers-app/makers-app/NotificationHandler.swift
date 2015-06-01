//
//  NotificationHandler.swift
//  makers-app
//
//  Created by Makers Laptop 16 on 01/06/2015.
//  Copyright (c) 2015 MakersApp. All rights reserved.
//

import Foundation
import UIKit

class NotificationHandler {

    var notification = UILocalNotification()
    init(alertBodyText:String){
        notification.alertBody = alertBodyText
        notification.alertAction = "open"
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }

}