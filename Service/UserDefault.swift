//
//  UserDefault.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 19/10/22.
//

import Foundation

extension UserDefaults {

    enum UserDefaultsKeys: String {
        case nameUser = "nameUser"
    }

    func setPersonName(value: String){
        set(value, forKey: UserDefaultsKeys.nameUser.rawValue)
    }
    func getPersonName() -> String? {
        return string(forKey: UserDefaultsKeys.nameUser.rawValue)
    }
}
