//
//  AppSettings.swift
//  Paulo Silva
//
//  Created by Paulo Silva on 01/01/2018.
//  Copyright © 2018 Paulo Silva. All rights reserved.
//

import Foundation
import UIKit

struct AppSettings {
    
    // Locale
    let kCountryCode: String = (Locale.current as NSLocale).object(forKey: .countryCode) as! String
    
    // Default Date & Time Fomats for the API Services
    let kApiDateFormat = "yyyy-MM-dd"
    let kApiTimeFormat = "HH:mm:ss"
    let kApiDateTimeFormat = "yyyy-MM-dd HH:mm:ss"
    
    //
    let kUMotifDateFormat = "EEEE d MMM yyyy"
    
    // Default Time Format
    let k24TimeFormat = "HH:mm"
    let k12TimeFormat = "h:mm a"
    
    // API's Settings
    let kApiBaseUrl = "https://..."
    let kApiToken = "token"
    
}
