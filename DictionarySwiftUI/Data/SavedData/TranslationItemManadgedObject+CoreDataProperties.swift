//
//  TranslationItemManadgedObject+CoreDataProperties.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.09.2021.
//
//

import Foundation
import CoreData


extension TranslationItemManadgedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TranslationItemManadgedObject> {
        return NSFetchRequest<TranslationItemManadgedObject>(entityName: "TranslationItemManadgedObject")
    }

    @NSManaged public var definitionItem: DefinitionItemManedgedObject?

}

extension TranslationItemManadgedObject : Identifiable {

}
