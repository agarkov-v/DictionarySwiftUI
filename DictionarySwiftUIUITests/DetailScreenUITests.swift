//
//  DetailScreenUITests.swift
//  DictionarySwiftUIUITests
//
//  Created by Vyacheslav Agarkov on 14.11.2021.
//

import XCTest

class DetailScreenUITests: XCTestCase {
	var app: XCUIApplication!

	override func setUpWithError() throws {
		try super.setUpWithError()
		continueAfterFailure = false
		app = XCUIApplication()
		app.launch()
	}

	override func tearDownWithError() throws {
		UITestsHelper.deleteApp()
		app = nil
		try super.tearDownWithError()
	}

	func testOpenDetailScreenAndAddToFavorite() {
		let title = app.staticTexts["titleLabel"]

		UITestsHelper.addDefinition()
		UITestsHelper.openFavoritesScreen()
		app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()

		XCTAssertEqual(title.label, "go")
	}
}
