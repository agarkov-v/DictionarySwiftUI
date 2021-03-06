//
//  DefinitionItemManagedObject.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 30.09.2021.
//

import CoreData

@objc(DefinitionItemManagedObject)
public class DefinitionItemManagedObject: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DefinitionItemManagedObject> {
        return NSFetchRequest<DefinitionItemManagedObject>(entityName: "DefinitionItemManagedObject")
    }

    @NSManaged public var id: String
    @NSManaged public var position: String?
    @NSManaged public var text: String
    @NSManaged public var translations: NSOrderedSet
}

// MARK: Generated accessors for translations
extension DefinitionItemManagedObject {
    @objc(insertObject:inTranslationsAtIndex:)
    @NSManaged public func insertIntoTranslations(_ value: TranslationItemManagedObject, at idx: Int)

    @objc(removeObjectFromTranslationsAtIndex:)
    @NSManaged public func removeFromTranslations(at idx: Int)

    @objc(insertTranslations:atIndexes:)
    @NSManaged public func insertIntoTranslations(_ values: [TranslationItemManagedObject], at indexes: NSIndexSet)

    @objc(removeTranslationsAtIndexes:)
    @NSManaged public func removeFromTranslations(at indexes: NSIndexSet)

    @objc(replaceObjectInTranslationsAtIndex:withObject:)
    @NSManaged public func replaceTranslations(at idx: Int, with value: TranslationItemManagedObject)

    @objc(replaceTranslationsAtIndexes:withTranslations:)
    @NSManaged public func replaceTranslations(at indexes: NSIndexSet, with values: [TranslationItemManagedObject])

    @objc(addTranslationsObject:)
    @NSManaged public func addToTranslations(_ value: TranslationItemManagedObject)

    @objc(removeTranslationsObject:)
    @NSManaged public func removeFromTranslations(_ value: TranslationItemManagedObject)

    @objc(addTranslations:)
    @NSManaged public func addToTranslations(_ values: NSOrderedSet)

    @objc(removeTranslations:)
    @NSManaged public func removeFromTranslations(_ values: NSOrderedSet)
}
