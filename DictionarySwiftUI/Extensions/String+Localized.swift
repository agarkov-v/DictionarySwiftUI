//
//  String+Localized.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.10.2021.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: String())
    }
}
