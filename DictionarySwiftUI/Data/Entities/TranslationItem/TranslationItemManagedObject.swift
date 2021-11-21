//
//  TranslationItemManagedObject.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.10.2021.
//

import CoreData
import SwiftUI

@objc(TranslationItemManagedObject)
public class TranslationItemManagedObject: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TranslationItemManagedObject> {
        return NSFetchRequest<TranslationItemManagedObject>(entityName: "TranslationItemManagedObject")
    }

    // MARK: - Public Properties

    @NSManaged public var position: String?
    @NSManaged public var text: String
    @NSManaged public var definition: DefinitionItemManagedObject?
    @NSManaged public var examples: NSOrderedSet?
    @NSManaged public var meanings: NSOrderedSet?
    @NSManaged public var synonyms: NSOrderedSet?
}

// MARK: Generated accessors for examples
extension TranslationItemManagedObject {
    @objc(insertObject:inExamplesAtIndex:)
    @NSManaged public func insertIntoExamples(_ value: ExampleItemManagedObject, at idx: Int)

    @objc(removeObjectFromExamplesAtIndex:)
    @NSManaged public func removeFromExamples(at idx: Int)

    @objc(insertExamples:atIndexes:)
    @NSManaged public func insertIntoExamples(_ values: [ExampleItemManagedObject], at indexes: NSIndexSet)

    @objc(removeExamplesAtIndexes:)
    @NSManaged public func removeFromExamples(at indexes: NSIndexSet)

    @objc(replaceObjectInExamplesAtIndex:withObject:)
    @NSManaged public func replaceExamples(at idx: Int, with value: ExampleItemManagedObject)

    @objc(replaceExamplesAtIndexes:withExamples:)
    @NSManaged public func replaceExamples(at indexes: NSIndexSet, with values: [ExampleItemManagedObject])

    @objc(addExamplesObject:)
    @NSManaged public func addToExamples(_ value: ExampleItemManagedObject)

    @objc(removeExamplesObject:)
    @NSManaged public func removeFromExamples(_ value: ExampleItemManagedObject)

    @objc(addExamples:)
    @NSManaged public func addToExamples(_ values: NSOrderedSet)

    @objc(removeExamples:)
    @NSManaged public func removeFromExamples(_ values: NSOrderedSet)
}

// MARK: Generated accessors for meanings
extension TranslationItemManagedObject {
    @objc(insertObject:inMeaningsAtIndex:)
    @NSManaged public func insertIntoMeanings(_ value: MeaningItemManagedObject, at idx: Int)

    @objc(removeObjectFromMeaningsAtIndex:)
    @NSManaged public func removeFromMeanings(at idx: Int)

    @objc(insertMeanings:atIndexes:)
    @NSManaged public func insertIntoMeanings(_ values: [MeaningItemManagedObject], at indexes: NSIndexSet)

    @objc(removeMeaningsAtIndexes:)
    @NSManaged public func removeFromMeanings(at indexes: NSIndexSet)

    @objc(replaceObjectInMeaningsAtIndex:withObject:)
    @NSManaged public func replaceMeanings(at idx: Int, with value: MeaningItemManagedObject)

    @objc(replaceMeaningsAtIndexes:withMeanings:)
    @NSManaged public func replaceMeanings(at indexes: NSIndexSet, with values: [MeaningItemManagedObject])

    @objc(addMeaningsObject:)
    @NSManaged public func addToMeanings(_ value: MeaningItemManagedObject)

    @objc(removeMeaningsObject:)
    @NSManaged public func removeFromMeanings(_ value: MeaningItemManagedObject)

    @objc(addMeanings:)
    @NSManaged public func addToMeanings(_ values: NSOrderedSet)

    @objc(removeMeanings:)
    @NSManaged public func removeFromMeanings(_ values: NSOrderedSet)
}

// MARK: Generated accessors for synonyms
extension TranslationItemManagedObject {
    @objc(insertObject:inSynonymsAtIndex:)
    @NSManaged public func insertIntoSynonyms(_ value: SynonymItemManagedObject, at idx: Int)

    @objc(removeObjectFromSynonymsAtIndex:)
    @NSManaged public func removeFromSynonyms(at idx: Int)

    @objc(insertSynonyms:atIndexes:)
    @NSManaged public func insertIntoSynonyms(_ values: [SynonymItemManagedObject], at indexes: NSIndexSet)

    @objc(removeSynonymsAtIndexes:)
    @NSManaged public func removeFromSynonyms(at indexes: NSIndexSet)

    @objc(replaceObjectInSynonymsAtIndex:withObject:)
    @NSManaged public func replaceSynonyms(at idx: Int, with value: SynonymItemManagedObject)

    @objc(replaceSynonymsAtIndexes:withSynonyms:)
    @NSManaged public func replaceSynonyms(at indexes: NSIndexSet, with values: [SynonymItemManagedObject])

    @objc(addSynonymsObject:)
    @NSManaged public func addToSynonyms(_ value: SynonymItemManagedObject)

    @objc(removeSynonymsObject:)
    @NSManaged public func removeFromSynonyms(_ value: SynonymItemManagedObject)

    @objc(addSynonyms:)
    @NSManaged public func addToSynonyms(_ values: NSOrderedSet)

    @objc(removeSynonyms:)
    @NSManaged public func removeFromSynonyms(_ values: NSOrderedSet)
}
