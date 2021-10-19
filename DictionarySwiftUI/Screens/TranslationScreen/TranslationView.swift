//
//  TranslationView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import SwiftUI

// MARK: Previews

#if DEBUG
struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TranslationView()
                .preferredColorScheme(.light)
                .previewDisplayName("Defult")
            
            TranslationView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
                .environment(\.locale, Locale.init(identifier: "ru"))
        }
    }
}
#endif

// MARK: TranslationView

struct TranslationView: View {
    
    // MARK: - Public Properties
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bar.ignoresSafeArea()
                    .allowsHitTesting(false)
                navigationLink
                
                VStack(spacing: .zero) {
                    SearchView(searchText: $viewModel.searchText)
                    Group {
                        if viewModel.definitions.isEmpty {
                            emptySection
                        } else {
                            resultList
                        }
                    }
                    .background(Color.background)
                }
                
            }
            .onAppear {
                viewModel.loadLocalData()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    // MARK: - Init
    
    init(
        viewModel: StateObject<TranslationViewModel> = StateObject(wrappedValue: TranslationViewModel())
    ) {
        _viewModel = viewModel
    }
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel: TranslationViewModel
    @State private var isCellTapped = false
    
    // MARK: Views
    
    private var emptySection: some View {
        Group {
            switch viewModel.state {
            case .local:
                EmptyDataView()
                
            case .search:
                Text("NoResults")
                
            case .searchInProgress:
                ProgressView()
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .foregroundColor(.gray)
    }
    
    private var resultList: some View {
        List {
            ForEach(viewModel.definitions) { definition in
                
                TranslationCell(translation: definition)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.selectedDefinition = definition
                        isCellTapped = true
                    }
            }
            .listRowBackground(Color.cell)
        }
        .onAppear() {
            UITableView.appearance().backgroundColor = UIColor.clear
        }
    }
    
    private var navigationLink: some View {
        NavigationLink(isActive: $isCellTapped) {
            
            viewModel.selectedDefinition.map {
                TranslationDetailView(
                    definitionItem: $0,
                    isScreenOpen: $isCellTapped
                )
            }
        } label: {
            EmptyView()
        }
    }
}
