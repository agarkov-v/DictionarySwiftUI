//
//  TranslationView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import SwiftUI

// MARK: Previews

struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TranslationViewModel()
        TranslationView(viewModel: viewModel)
    }
}

// MARK: TranslationView

struct TranslationView: View {
    
    // MARK: Public Properties
    
    let lang: [String] = ["ru", "en", "fr", "jp", "ch", "ge",]
    
    @ObservedObject var viewModel: TranslationViewModel
    
    // MARK: Body
    
    var body: some View {
        VStack {
            SearchView()
            
            if viewModel.translations.isEmpty {
                emptySection
            } else {
                resultList
            }
            
        }
    }
    
    // MARK: Private Properties
    
    private var emptySection: some View {
      Section {
        Spacer()
        Text("No results")
          .foregroundColor(.gray)
        Spacer()
      }
    }
    
    private var resultList: some View {
        List {
            ForEach(viewModel.translations) {
                TranslationCell(translation: $0)
            }
        }
    }
}
