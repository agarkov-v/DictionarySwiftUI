//
//  SynonymItemManagedObject.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.10.2021.
//

import CoreData

@objc(SynonymItemManagedObject)
public class SynonymItemManagedObject: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SynonymItemManagedObject> {
        return NSFetchRequest<SynonymItemManagedObject>(entityName: "SynonymItemManagedObject")
    }

    @NSManaged public var position: String?
    @NSManaged public var text: String
    @NSManaged public var translation: TranslationItemManagedObject?
}
