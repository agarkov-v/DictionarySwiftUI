//
//  PersistenceManager.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 18.09.2021.
//

import Foundation
import CoreData

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DictionarySwiftUI")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
//    func saveContext () {
//        if container.viewContext.hasChanges {
//            do {
//                try container.viewContext.save()
//            } catch {
//                container.viewContext.rollback()
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
}
