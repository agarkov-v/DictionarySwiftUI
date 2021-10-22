//
//  SearchView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 11.09.2021.
//

import SwiftUI

// MARK: Previews

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
                .previewDisplayName("Defult")
            
            SearchView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
            
            SearchView(searchText: .constant(""))
                .environment(\.locale, Locale.init(identifier: "ru"))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .previewDisplayName("Ru")
        }
    }
}
#endif

// MARK: - SearchView

struct SearchView: View {
    
    // MARK: - Public Properties
    
    @Binding var searchText: String
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                languageButtons
                searchTextView
                if !searchText.isEmpty {
                    clearButtonView
                }
            }
            .padding(.bottom, 5)
            Divider()
        }
    }
    
    // MARK: - Init
    
    init(
        searchText: Binding<String>,
        viewModel: StateObject<SearchViewModel> = StateObject(wrappedValue: SearchViewModel())
    ) {
        _searchText = searchText
        _viewModel = viewModel
    }
    
    
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel: SearchViewModel
    @State private var isFromButtonTapped = false
    @State private var isToButtonTapped = false
    
    // MARK: - Views
    
    private var languageButtons: some View {
        VStack {
            
            Button(viewModel.translateFromLanguage.rawValue) {
                isFromButtonTapped.toggle()
            }
			.accessibilityIdentifier("translateFromLanguageButton")
            .frame(maxWidth: .infinity)
            .sheet(
                isPresented: $isFromButtonTapped,
                content: {
                    LanguageSelectionView(selectedLanguage: $viewModel.translateFromLanguage)
                }
            )
            
            Button(viewModel.translateToLanguage.rawValue) {
                isToButtonTapped.toggle()
            }
			.accessibilityIdentifier("translateToLanguageButton")
            .frame(maxWidth: .infinity)
            .sheet(
                isPresented: $isToButtonTapped,
                content: {
                    LanguageSelectionView(selectedLanguage: $viewModel.translateToLanguage)
                }
            )
        }
        .frame(width: 40)
        
    }
    
    
    private var searchTextView: some View {
        
        TextField(
            LocalizedStringKey("Search"),
            text: $searchText
        )
			.accessibilityIdentifier("searchTextField")
            .textFieldStyle(MainTextFieldStyle(backroundColor: Color.background))
            .padding(.trailing, searchText.isEmpty ? 40 : 0)
    }
    
    private var clearButtonView: some View {
        Button {
            searchText = ""
        } label: {
            Image(systemName: "xmark.circle")
        }
		.accessibilityIdentifier("clearButton")
        .frame(width: 40, height: 40)

    }
}
