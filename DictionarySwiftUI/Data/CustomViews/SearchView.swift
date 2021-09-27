//
//  SearchView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 11.09.2021.
//

import SwiftUI

// MARK: Previews

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
                .previewDisplayName("Defult")
            
            //            SearchView()
            //                .previewLayout(.sizeThatFits)
            //                .preferredColorScheme(.dark)
            //                .previewDisplayName("Dark Mode")
        }
    }
}

// MARK: SearchView

struct SearchView: View {
    
    // MARK: Private Properties
    
    @State private var searchText = ""
    
    @State private var fromLanguage: Language = Language.russian
    @State private var toLanguage: Language = Language.english
    
    @State private var fromLanguages = Language.allCases
    @State private var toLanguages = Language.allCases
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                languageButtons
                TextField("Search", text: $searchText)
                searchView
            }
            Divider()
        }
    }
    
    // MARK: View
    
    private var languageButtons: some View {
        VStack {
            
            Button(fromLanguage.rawValue) {
                
//                NavigationLink("ToLang", destination: LanguageSelection())
            }
            .frame(maxWidth: .infinity)
            Button(toLanguage.rawValue) {
                //
            }
            .frame(maxWidth: .infinity)
        }
        .frame(width: 40)
    }
    
    private var searchView: some View {
        Image(systemName: "magnifyingglass")
            .frame(width: 20, height: 20)
            .onTapGesture {
                #if canImport(UIKit)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                #endif
            }
    }
}
