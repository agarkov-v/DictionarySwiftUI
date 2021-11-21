//
//  SearchViewUITests.swift
//  DictionarySwiftUIUITests
//
//  Created by Vyacheslav Agarkov on 14.11.2021.
//

import XCTest

class SearchViewUITests: XCTestCase {
	var app: XCUIApplication!

	override func setUpWithError() throws {
		try super.setUpWithError()
		continueAfterFailure = false
		app = XCUIApplication()
		app.launch()
		UITestsHelper.openSearchScreen()
	}

	override func tearDownWithError() throws {
		UITestsHelper.deleteApp()
		app = nil
		try super.tearDownWithError()
	}

	func testClearButtonVisability() {
		// Given
		let clearButton = app.buttons["clearButton"]
		let textField = app.textFields["searchTextField"]

		// When
		textField.tap()
		textField.typeText("go\n")

		// Then
		XCTAssertTrue(clearButton.exists)
	}

	func testChangeLanguage() {
		let translateToLanguageButton = app.buttons["translateToLanguageButton"]

		translateToLanguageButton.tap()
		app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()

		XCTAssertEqual(translateToLanguageButton.label, "Russian")
	}

	func testSwitchLanguages() {
		let switchLanguagesButton = app.buttons["switchLanguagesButton"]
		let translateFromLanguageButton = app.buttons["translateFromLanguageButton"]
		let translateToLanguageButton = app.buttons["translateToLanguageButton"]

		switchLanguagesButton.tap()

		XCTAssertEqual(translateFromLanguageButton.label, "Russian")
		XCTAssertEqual(translateToLanguageButton.label, "English")
	}
}
