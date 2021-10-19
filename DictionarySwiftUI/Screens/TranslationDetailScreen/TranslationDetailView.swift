//
//  TranslationDetailView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 11.09.2021.
//

import SwiftUI
import UIKit

// MARK: - Previews

#if DEBUG
struct TranslationDetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let definitionItem = TranslationResponse.petMockData.definition.first!
        
        Group {
            TranslationDetailView(
                definitionItem: definitionItem,
                isScreenOpen: .constant(true)
            )
                .preferredColorScheme(.light)
                .previewDisplayName("Defult")
            
            TranslationDetailView(
                definitionItem: definitionItem,
                isScreenOpen: .constant(true)
            )
                .environment(\.locale, Locale.init(identifier: "ru"))
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
#endif

// MARK: - TranslationDetailView

struct TranslationDetailView: View {
    
    // MARK: - Public Properties
    
    @Binding var isScreenOpen: Bool
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.bar.ignoresSafeArea()
            Group {
                VStack(spacing: .zero) {
                    wordView
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .fixedSize(horizontal: false, vertical: true)
                    translationList
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
            }
            .background(Color.background)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("◀ \("OnBack".localized)") {
                    isScreenOpen.toggle()
                }
            }
        }
    }
    
    // MARK: - Init
    
    init(
        definitionItem: DefinitionItem,
        isScreenOpen: Binding<Bool>
    ) {
        _viewModel = StateObject(
            wrappedValue: TranslationDetailViewModel(definitionItem: definitionItem)
        )
        _isScreenOpen = isScreenOpen
    }
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel: TranslationDetailViewModel
    
    // MARK: - Views
    
    private var wordView: some View {
        HStack(spacing: .zero) {
            Text(viewModel.definitionItem.text)
                .font(.system(size: 25, weight: .semibold))
            
            Spacer()
            
            VStack {
                Button(action: {
                    viewModel.onFavoriteButtonTap()
                }, label: {
                    Image(systemName: viewModel.isFavorite ? "star.fill" : "star")
                })
                    .padding()
                Spacer()
            }
        }
    }
    
    private var translationList: some View {
        List {
            ForEach(viewModel.definitionItem.translations, id: \.self) { translition in
                makeTranslationSection(translition)
                makeMeaningSection(translition)
                makeSynonymSection(translition)
                makeExampleSection(translition)
                
            }
            .listRowBackground(Color.cell)
        }
        .listStyle(.grouped)
    }
    
    // MARK: Private Methods
    
    @ViewBuilder
    private func makeTranslationSection(_ view: TranslationItem) -> some View {
        Section {
            Text(view.text)
        } header: {
            let translationHeading = "━ \("Translation".localized) ━"
            Text(LocalizedStringKey(translationHeading))
        }
    }
    
    @ViewBuilder
    private func makeSynonymSection(_ view: TranslationItem) -> some View {
        view.synonyms.map { synonyms in
            Section(content: {
                ForEach(synonyms , id: \.self) { synonym in
                    Text(synonym.text)
                }
            }, header: {
                Text("Synonyms")
            })
        }
    }
    
    @ViewBuilder
    private func makeMeaningSection(_ view: TranslationItem) -> some View {
        view.meanings.map { meanings in
            Section(content: {
                ForEach(meanings, id: \.self) { meaning in
                    Text(meaning.text)
                }
            }, header: {
                Text("Meanings")
            })
        }
    }
    
    @ViewBuilder
    private func makeExampleSection(_ view: TranslationItem) -> some View {
        view.examples.map { examples in
            Section(content: {
                ForEach(examples, id: \.self) { example in
                    Text(example.text)
                }
            }, header: {
                Text("Examples")
            })
        }
    }
    
}
