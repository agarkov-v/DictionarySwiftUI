//
//  UserSettings.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 18.09.2021.
//

import Foundation

class UserSettings {
    
    static let shared = UserSettings()
    
    private let userDefaults = UserDefaults.standard
    
    // MARK: Public Properties
    
    var fromLanguage: Language {
        get {
            let languageDefault: Language = .english
            guard
                let language = UserDefaults.standard.value(forKey: UnsecuredKeys.fromLanguage) as? String
            else {
                return languageDefault
            }
            
            return Language(rawValue: language) ?? languageDefault
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UnsecuredKeys.fromLanguage)
        }
    }
    
    var toLanguage: Language {
        get {
            let languageDefault: Language = .russian
            guard
                let language = UserDefaults.standard.value(forKey: UnsecuredKeys.toLanguage) as? String
            else {
                return languageDefault
            }
            
            return Language(rawValue: language) ?? languageDefault
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UnsecuredKeys.toLanguage)
        }
    }
}

// MARK: - Saving keys
extension UserSettings {
    
    private enum UnsecuredKeys {
        static let fromLanguage = "kFromLanguage"
        static let toLanguage = "kToLanguage"
    }
}
