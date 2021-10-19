//
//  MeaningItemManagedObject.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.10.2021.
//

import CoreData

@objc(MeaningItemManagedObject)
public class MeaningItemManagedObject: NSManagedObject, Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeaningItemManagedObject> {
        return NSFetchRequest<MeaningItemManagedObject>(entityName: "MeaningItemManagedObject")
    }
    
    @NSManaged public var text: String
    @NSManaged public var translation: TranslationItemManagedObject?
    
    func fill(with meaningItem: MeaningItem) {
        text = meaningItem.text
    }
}
