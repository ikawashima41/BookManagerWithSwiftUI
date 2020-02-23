//
//  AppUserDetault.swift
//  BookManagerWithSwiftUI
//
//  Created by Iichiro Kawashima on 2020/02/23.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation

final class AppUserDefaults {
    // 初回起動フラグ
    static func getFirstLaunchFrag() -> Bool {
        return getBoolValue(keyName: "FirstLaunch")
    }

    static func setFirstLaunchFrag() {
        putBoolValue(true, keyName: "FirstLaunch")
    }

    // ログインフラグ
    static func getSessionToken() -> String {
        return getStringValue(keyName: "auth_token")
    }

    static func setSessionToken(token: String) {
        putStringValue(token, keyName: "auth_token")
    }

    static func isLogin() -> Bool {
        if getSessionToken().isEmpty {
            return false
        }
        return true
    }

    static func clearAuthToken() {
        putStringValue("", keyName: "auth_token")
    }

}

extension AppUserDefaults {
    static func getBoolValue(keyName: String) -> Bool {
        let userDefaults: UserDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: keyName)
    }

    static func putBoolValue(_ value: Bool, keyName: String) {
        let userDefaults: UserDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: keyName)
        userDefaults.synchronize()
    }

    static func getStringValue(keyName: String) -> String {
        let userDefaults: UserDefaults = UserDefaults.standard
        return userDefaults.string(forKey: keyName) ?? ""
    }

    static func putStringValue(_ value: String, keyName: String) {
        let userDefaults: UserDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: keyName)
        userDefaults.synchronize()
    }
}
