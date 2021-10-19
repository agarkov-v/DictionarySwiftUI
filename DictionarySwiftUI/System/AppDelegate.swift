//
//  AppDelegate.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.08.2021.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    private let coreDataStorage = CoreDataStorage()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        debugPrint("didFinishLaunchingWithOptions")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        coreDataStorage.saveContext()
    }
}
