//
//  InteracrorLayer.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 04.10.2021.
//

import Foundation

class InteractorLayer {
    public static let shared = InteractorLayer()

    public lazy var definitionInteractor: DefinitionInteractorProtocol = DefinitionInteractor()
}
