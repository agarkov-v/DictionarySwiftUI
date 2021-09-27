//
//  DictionarySwiftUIApp.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 22.07.2021.
//

import SwiftUI
import CoreData

@main
struct DictionarySwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
//            testView()
//            ContentView()
        }
    }
}
