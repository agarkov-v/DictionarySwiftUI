//
//  GameDetailView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 11.09.2021.
//

import SwiftUI

// MARK: Previews

#if DEBUG
struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let definitionItem = TranslationResponse.petMockData.definition.first!
        
        Group {
            GameDetailView(definitionItem: definitionItem)
                .preferredColorScheme(.light)
                .previewDisplayName("Defult")
            
            GameDetailView(definitionItem: definitionItem)
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
                .environment(\.locale, Locale.init(identifier: "ru"))
        }
    }
}
#endif

// MARK: GameView

struct GameDetailView: View {
    
    // MARK: - Public Properties
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.bar.ignoresSafeArea()
                .allowsHitTesting(false)
            
            VStack {
                Group {
                    definitionView
                    translationTextView
                    if viewModel.isButtonTapped {
                        compareView
                    }
                    submitButtonView
                }
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 20,
                        bottom: 0,
                        trailing: 20)
                )
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(Color.background)
            
        }
        .navigationBarTitle("TranslateWord", displayMode: .large)
    }
    
    // MARK: - Init
    
    init(
        definitionItem: DefinitionItem
    ) {
        _viewModel = StateObject(wrappedValue: GameDetailViewModel(definition: definitionItem))
    }
    
    // MARK: - Private Properties
    @State private var isScreenOpen = false
    @StateObject private var viewModel: GameDetailViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    // MARK: Views
    
    private var definitionView: some View {
        HStack(spacing: .zero) {
            
            HStack(alignment: .top) {
                Text(viewModel.definitionItem.text)
                    .font(Font.system(size: 30))
                
                NavigationLink {
                    TranslationDetailView(
                        definitionItem: viewModel.definitionItem,
                        isScreenOpen: $isScreenOpen)
                } label: {
                    Label(
                        "Hint",
                        systemImage: "questionmark.circle"
                    )
                        .font(Font.system(size: 10))
                        .labelStyle(VerticalLabelStyle())
                }
            }
            
            Spacer()
        }
    }
    
    private var translationTextView: some View {
        TextField(
            LocalizedStringKey("Translation"),
            text: $viewModel.translationText
        )
            .textFieldStyle(MainTextFieldStyle(backroundColor: Color.bar))
    }
    
    private var submitButtonView: some View {
        Button("Submit") {
            viewModel.compareTranslation()
        }
        .buttonStyle(MainButtonStyle())
        .padding(.top, 50)
    }
    
    private var compareView: some View {
        if viewModel.isTranslationCorrect {
            return Label(
                "CorrectTranslation",
                systemImage: "checkmark.circle"
            )
                .frame(maxWidth: .infinity)
                .foregroundColor(.green)
            
            
        } else {
            return Label(
                "IncorrectTranslation",
                systemImage: "xmark.circle"
            )
                .frame(maxWidth: .infinity)
                .foregroundColor(.red)
        }
    }
}
