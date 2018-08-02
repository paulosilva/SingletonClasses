//
//  AppEnvironment.swift
//  Paulo Silva
//
//  Created by Paulo Silva on 01/01/2018.
//  Copyright © 2018 Paulo Silva. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

class AppEnvironment {
    
    // MARK: - Singlton
    
    static let sharedInstance = AppEnvironment()
    
    // MARK: - Properties
    
    //
    var systemName: String {
        get {
            return UIDevice.current.systemName
        }
    }
    
    //
    var systemVersion: String {
        get {
            return UIDevice.current.systemVersion
        }
    }
    
    //
    var deviceModel: String {
        get {
            return UIDevice.current.model
        }
    }
    
    //
    var userInterfaceIdiom: UIUserInterfaceIdiom {
        get {
            return UIDevice.current.userInterfaceIdiom
        }
    }
    
    //
    var isMultitaskingSupported: Bool {
        get {
            return UIDevice.current.isMultitaskingSupported
        }
    }
    
    //
    var batteryLevel: Float {
        get {
            return UIDevice.current.batteryLevel
        }
    }
    
    //
    var isBatteryMonitoringEnabled: Bool {
        get {
            return UIDevice.current.isBatteryMonitoringEnabled
        }
        set (inputValue) {
            UIDevice.current.isBatteryMonitoringEnabled = inputValue
        }
    }
    
    
    // is dirty
    private var isDirty: Bool = false
    
    //
    private var _guid: String = ""
    var guid: String {
        get {
            return self._guid
        }
        set(inputValue) {
            if (inputValue != self._guid) {
                self.isDirty = true
                self._guid = inputValue
            }
        }
    }
    
    // MARK: - Methods
    
    private var isInitialized: Bool = false
    
    //
    init (){
        
        // On Init set defaults values as needed
        
        //
        self.getAppDefauls ()
                
    }
    
    deinit {
        
        // On deinit set defaults values as needed
        setAppDefauls()
        
    }
    
    func getAppDefauls () {
        
        if (self.isInitialized == true ) {
            return
        }
        
        if (UserDefaults.standard.existsValue(forKey: "Settings.App.Guid") == true ) {
            self._guid = UserDefaults.standard.string(forKey: "Settings.App.Guid")!
        }
        
        //
        self.isInitialized = true
        
    }
    
    func setAppDefauls () {
        
        if (self.isDirty) {
            
            UserDefaults.standard.set("\(self._guid)", forKey: "Settings.App.Guid")

            // Force UserDefaults to be persisted
            UserDefaults.standard.synchronize()
            
            self.isDirty = false
        }
        
    }
    
    /*
     func loadPList() {}
     */
    
}
