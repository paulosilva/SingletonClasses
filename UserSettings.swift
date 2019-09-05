//
//  UserSettings.swift
//  Paulo Silva
//
//  Created by Paulo Silva on 01/01/2018.
//  Copyright © 2018 Paulo Silva. All rights reserved.
//

import Foundation

class UserSettings {

    // MARK: - Singlton

    static let sharedInstance = UserSettings()

    // MARK: - Properties

    private var isDirty: Bool = false
    private var isInitialized: Bool = false

    // MARK: - Properties

    public var isLoggedIn: Bool = false {
        didSet {
            self.isDirty = true
        }
    }

    public var isRegistered: Bool = false {
        didSet {
            self.isDirty = true
        }
    }

    public var isLockedOut: Bool = false {
        didSet {
            self.isDirty = true
        }
    }

    public var isApproved: Bool = false {
        didSet {
            self.isDirty = true
        }
    }

    public var agreeDisclaimerTerms: Bool = false {
        didSet {
            self.isDirty = true
        }
    }

    public var agreePrivacyPolicy: Bool = false {
        didSet {
            self.isDirty = true
        }
    }

    public var guid: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var name: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var username: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var email: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var token: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var deviceToken: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var localeID: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var fallbackLanguage: String = "en-US" {
        didSet {
            self.isDirty = true
        }
    }

    //public var defaultLanguage: String = "en-US" // language
    public var language: String = "en-US" {
        didSet {
            self.isDirty = true
        }
    }

    public var createdOn: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var updatedOn: String = "" {
        didSet {
            self.isDirty = true
        }
    }

    public var biometricAuthentication: Bool = false {
        didSet {
            self.isDirty = true
        }
    }

    public var keyChain: Bool = true {
        didSet {
            self.isDirty = true
        }
    }

    // MARK: - Methods

    init () {
        // On Init set defaults values as needed
        self.getUserDefauls ()
    }

    deinit {
        // On deinit set defaults values as needed
        self.setUserDefauls()
    }

    func getUserDefauls () {
        if self.isInitialized == true {
            return
        }
        self.isLoggedIn = UserDefaults.standard.boolValue(forKey: "Settings.User.IsLoggedIn")
        self.isRegistered = UserDefaults.standard.boolValue(forKey: "Settings.User.IsRegistered")
        self.isLockedOut = UserDefaults.standard.boolValue(forKey: "Settings.User.IsLockedOut")
        self.isApproved = UserDefaults.standard.boolValue(forKey: "Settings.User.IsApproved")
        self.agreeDisclaimerTerms = UserDefaults.standard.boolValue(forKey: "Settings.User.AgreeDisclaimerTerms")
        self.agreePrivacyPolicy = UserDefaults.standard.boolValue(forKey: "Settings.User.AgreePrivacyPolicy")
        self.guid = UserDefaults.standard.stringValue(forKey: "Settings.User.Guid")
        self.name = UserDefaults.standard.stringValue(forKey: "Settings.User.Name")
        self.username = UserDefaults.standard.stringValue(forKey: "Settings.User.Username")
        self.email = UserDefaults.standard.stringValue(forKey: "Settings.User.Email")
        self.token = UserDefaults.standard.stringValue(forKey: "Settings.User.Token")
        self.deviceToken = UserDefaults.standard.stringValue(forKey: "Settings.User.DeviceToken")
        if UserDefaults.standard.existsValue(forKey: "Settings.User.LocaleID") == true {
            self.localeID = UserDefaults.standard.string(forKey: "Settings.User.LocaleID")!
        } else {
            self.localeID = Locale.current.identifier
        }
        if UserDefaults.standard.existsValue(forKey: "Settings.User.Language") == true {
            self.language = UserDefaults.standard.string(forKey: "Settings.User.Language")!
        } else {
            self.language = Locale.current.languageCode ?? "en"
        }
        if UserDefaults.standard.existsValue(forKey: "System.Fallback.Language") == true {
            self.fallbackLanguage = UserDefaults.standard.string(forKey: "System.Fallback.Language")!
        } else {
            self.fallbackLanguage = "en"
        }
        /*
         if UserDefaults.standard.existsValue(forKey: "User.Default.Language") == true {
         self.defaultLanguage = UserDefaults.standard.string(forKey: "User.Default.Language")!
         } else {
         self.defaultLanguage = "en"
         }
         */
        self.createdOn = UserDefaults.standard.stringValue(forKey: "Settings.User.CreatedOn")
        self.updatedOn = UserDefaults.standard.stringValue(forKey: "Settings.User.UpdatedOn")
        self.biometricAuthentication = UserDefaults.standard.boolValue(forKey: "Settings.User.BiometricAuthentication")
        self.keyChain = UserDefaults.standard.boolValue(forKey: "Settings.User.KeyChain")
        self.isInitialized = true
    }

    func setUserDefauls () {
        if self.isDirty {
            UserDefaults.standard.set("\(self.isLoggedIn)", forKey: "Settings.User.IsLoggedIn")
            UserDefaults.standard.set("\(self.isRegistered)", forKey: "Settings.User.IsRegistered")
            UserDefaults.standard.set("\(self.isLockedOut)", forKey: "Settings.User.IsLockedOut")
            UserDefaults.standard.set("\(self.isApproved)", forKey: "Settings.User.IsApproved")
            UserDefaults.standard.set("\(self.agreeDisclaimerTerms)", forKey: "Settings.User.AgreeDisclaimerTerms")
            UserDefaults.standard.set("\(self.agreePrivacyPolicy)", forKey: "Settings.User.AgreePrivacyPolicy")
            UserDefaults.standard.set("\(self.guid)", forKey: "Settings.User.Guid")
            UserDefaults.standard.set("\(self.name)", forKey: "Settings.User.Name")
            UserDefaults.standard.set("\(self.username)", forKey: "Settings.User.Username")
            UserDefaults.standard.set("\(self.email)", forKey: "Settings.User.Email")
            UserDefaults.standard.set("\(self.token)", forKey: "Settings.User.Token")
            UserDefaults.standard.set("\(self.deviceToken)", forKey: "Settings.User.DeviceToken")
            UserDefaults.standard.set("\(self.localeID)", forKey: "Settings.User.LocaleID")
            UserDefaults.standard.set("\(self.language)", forKey: "Settings.User.Language")
            UserDefaults.standard.set("\(self.fallbackLanguage)", forKey: "System.Fallback.Language")
            /*UserDefaults.standard.set("\(self.defaultLanguage)", forKey: "User.Default.Language") // Settings.User.Language */
            UserDefaults.standard.set("\(self.createdOn)", forKey: "Settings.User.CreatedOn")
            UserDefaults.standard.set("\(self.updatedOn)", forKey: "Settings.User.UpdatedOn")
            UserDefaults.standard.set("\(self.biometricAuthentication)", forKey: "Settings.User.BiometricAuthentication")
            UserDefaults.standard.set("\(self.keyChain)", forKey: "Settings.User.KeyChain")
            // Force UserDefaults to be persisted
            UserDefaults.standard.synchronize()
            self.isDirty = false
        }
    }
}

extension UserDefaults {
    func existsValue(forKey key: String) -> Bool {
        return nil != object(forKey: key)
    }
    func boolValue(forKey key: String) -> Bool {
        if existsValue(forKey: key) {
            return bool(forKey: key)
        }
        return false
    }
    func stringValue(forKey key: String) -> String {
        if self.existsValue(forKey: key) {
            return string(forKey: key)!
        }
        return ""
    }
}
