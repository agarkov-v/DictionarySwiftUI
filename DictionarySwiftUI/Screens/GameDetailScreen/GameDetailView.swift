//
//  GameDetailView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 11.09.2021.
//

import SwiftUI

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

					compareView
						.accessibilityIdentifier("compareMessage")
						.opacity(viewModel.isButtonTapped ? 1 : 0)
						.animation(.default)

					submitButtonView
				}
				.padding(
					EdgeInsets(
						top: 0,
						leading: 20,
						bottom: 0,
						trailing: 20
					)
				)
			}
			.frame(
				maxWidth: .infinity,
				maxHeight: .infinity
			)
			.background(Color.background)
		}
		.navigationBarTitle("TranslateWord", displayMode: .large)
		.onChange(of: mainNavigation.needsNavigation) { _ in
			presentationMode.wrappedValue.dismiss()
		}
	}

	// MARK: - Init

	init(
		definitionItem: DefinitionItem
	) {
		_viewModel = StateObject(wrappedValue: GameDetailViewModel(definition: definitionItem))
	}

	// MARK: - Private Properties
	@StateObject private var viewModel: GameDetailViewModel
	@Environment(\.presentationMode) private var presentationMode
	@EnvironmentObject private var mainNavigation: MainNavigation

	// MARK: Views

	private var definitionView: some View {
		HStack(spacing: .zero) {
			HStack(alignment: .top) {
				Text(viewModel.definitionItem.text)
					.font(Font.system(size: 30))

				Label(
					"Hint",
					systemImage: "questionmark.circle"
				)
					.foregroundColor(Color.mainAccent)
					.accessibilityIdentifier("hintLink")
					.font(Font.system(size: 10))
					.labelStyle(VerticalLabelStyle())
					.onTapGesture {
						viewModel.isHintTapped.toggle()
					}
					.sheet(isPresented: $viewModel.isHintTapped) {
						TranslationDetailView(definitionItem: viewModel.definitionItem)
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
		.accessibilityIdentifier("submitButton")
		.padding(.top, 50)
	}

	private var compareView: some View {
		if viewModel.isTranslationCorrect {
			return Label(
				"CorrectTranslation",
				systemImage: "checkmark.circle"
			)
				.font(Font.system(size: 12))
				.foregroundColor(.green)
		} else {
			return Label(
				"IncorrectTranslation",
				systemImage: "xmark.circle"
			)
				.font(Font.system(size: 12))
				.foregroundColor(.red)
		}
	}
}

// MARK: Previews

#if DEBUG
struct GameDetailView_Previews: PreviewProvider {
	static var previews: some View {
		let definitionItem = MockHelper.petMockData.definition.first!
		let gameDetailView = GameDetailView(definitionItem: definitionItem)

		Group {
			gameDetailView
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			gameDetailView
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")
				.environment(\.locale, Locale.init(identifier: "ru"))
		}
	}
}
#endif
