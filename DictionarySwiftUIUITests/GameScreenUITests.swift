//
//  GameScreenUITests.swift
//  DictionarySwiftUIUITests
//
//  Created by Vyacheslav Agarkov on 14.11.2021.
//

import XCTest

class GameScreenUITests: XCTestCase {
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

	func testOpenGameDetailScreen() {
		UITestsHelper.openGameDetailScreen()

		let title = app.navigationBars.staticTexts["Translate the Word"]
		XCTAssertTrue(title.exists)
	}

	func testMessageVisability() {
		UITestsHelper.openGameDetailScreen()
		let messageText = app.staticTexts["compareMessage"]
		let submitButton = app.buttons["submitButton"]

		if !submitButton.isHittable {
			let coordinate: XCUICoordinate = submitButton.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
			coordinate.tap()
		} else {
			submitButton.tap()
		}

		XCTAssertTrue(messageText.exists)
	}

	func testHintSelection() {
		UITestsHelper.openGameDetailScreen()
		let hintLink = app.buttons["hintLink"]
		let title = app.staticTexts["titleLabel"]

		if !hintLink.isHittable {
			let coordinate: XCUICoordinate = hintLink.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
			coordinate.tap()
		} else {
			hintLink.tap()
		}

		XCTAssertEqual(title.label, "go")
	}
}
