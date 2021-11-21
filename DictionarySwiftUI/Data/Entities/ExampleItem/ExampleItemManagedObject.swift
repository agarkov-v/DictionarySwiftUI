//
//  ExampleItemManagedObject.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.10.2021.
//

import CoreData

@objc(ExampleItemManagedObject)
public class ExampleItemManagedObject: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExampleItemManagedObject> {
        return NSFetchRequest<ExampleItemManagedObject>(entityName: "ExampleItemManagedObject")
    }

    @NSManaged public var text: String
    @NSManaged public var translations: TranslationItemManagedObject?
}
