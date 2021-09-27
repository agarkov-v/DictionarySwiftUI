//
//  LanguageSelection.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 18.09.2021.
//

import SwiftUI

// MARK: Previews

struct LanguageSelection_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelection()
    }
}

// MARK: LanguageSelectionView

struct LanguageSelection: View {
    
    private let languages: [Language] = Language.allCases
    
    var body: some View {
        VStack {
            Text("Choose language")
            List {
                ForEach(languages, id: \.self) {
                    Text($0.rawValue)
                }
            }
            
        }
    }
}

