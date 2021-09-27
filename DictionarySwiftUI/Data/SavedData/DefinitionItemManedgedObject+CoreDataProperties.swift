//
//  DefinitionItemManedgedObject+CoreDataProperties.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.09.2021.
//
//

import Foundation
import CoreData


extension DefinitionItemManedgedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DefinitionItemManedgedObject> {
        return NSFetchRequest<DefinitionItemManedgedObject>(entityName: "DefinitionItemManedgedObject")
    }

    @NSManaged public var text: String?
    @NSManaged public var attribute: NSObject?
    @NSManaged public var translations: NSOrderedSet?

}

// MARK: Generated accessors for translations
extension DefinitionItemManedgedObject {

    @objc(insertObject:inTranslationsAtIndex:)
    @NSManaged public func insertIntoTranslations(_ value: TranslationItemManadgedObject, at idx: Int)

    @objc(removeObjectFromTranslationsAtIndex:)
    @NSManaged public func removeFromTranslations(at idx: Int)

    @objc(insertTranslations:atIndexes:)
    @NSManaged public func insertIntoTranslations(_ values: [TranslationItemManadgedObject], at indexes: NSIndexSet)

    @objc(removeTranslationsAtIndexes:)
    @NSManaged public func removeFromTranslations(at indexes: NSIndexSet)

    @objc(replaceObjectInTranslationsAtIndex:withObject:)
    @NSManaged public func replaceTranslations(at idx: Int, with value: TranslationItemManadgedObject)

    @objc(replaceTranslationsAtIndexes:withTranslations:)
    @NSManaged public func replaceTranslations(at indexes: NSIndexSet, with values: [TranslationItemManadgedObject])

    @objc(addTranslationsObject:)
    @NSManaged public func addToTranslations(_ value: TranslationItemManadgedObject)

    @objc(removeTranslationsObject:)
    @NSManaged public func removeFromTranslations(_ value: TranslationItemManadgedObject)

    @objc(addTranslations:)
    @NSManaged public func addToTranslations(_ values: NSOrderedSet)

    @objc(removeTranslations:)
    @NSManaged public func removeFromTranslations(_ values: NSOrderedSet)

}

extension DefinitionItemManedgedObject : Identifiable {

}
