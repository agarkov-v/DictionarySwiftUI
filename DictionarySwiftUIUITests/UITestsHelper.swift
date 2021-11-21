//
//  UITestsHelper.swift
//  DictionarySwiftUIUITests
//
//  Created by Vyacheslav Agarkov on 14.11.2021.
//

import XCTest

class UITestsHelper {
	static func deleteApp() {
		XCUIApplication().terminate()

		let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
		let icon = springboard.icons["Dictionary"]

		if icon.exists {
			icon.press(forDuration: 1.3)

			springboard.buttons["Remove App"].tap()

			let deleteAppButton = springboard.alerts.buttons["Delete App"].firstMatch
			if deleteAppButton.waitForExistence(timeout: 2) {
				deleteAppButton.tap()
			}

			let deleteButton = springboard.alerts.buttons["Delete"].firstMatch
			if deleteButton.waitForExistence(timeout: 2) {
				deleteButton.tap()
			}
		}
	}

	static func openFavoritesScreen() {
		let app = XCUIApplication()
		let tabBar = app.tabBars["Tab Bar"]
		let favoritesScreen = tabBar.buttons["favorites"]
		favoritesScreen.tap()
	}

	static func openSearchScreen() {
		let app = XCUIApplication()
		let tabBar = app.tabBars["Tab Bar"]
		let searchScreen = tabBar.buttons["search"]
		searchScreen.tap()
	}

	static func openGameScreen() {
		let app = XCUIApplication()
		let tabBar = app.tabBars["Tab Bar"]
		let gameScreen = tabBar.buttons["game"]
		gameScreen.tap()
	}

	static func addDefinition() {
		let app = XCUIApplication()
		openSearchScreen()

		let textField = app.textFields["searchTextField"]
		let favoriteButton = app.buttons["favoriteButton"]
		let backButton = app.navigationBars.buttons.element(boundBy: 0)
		let clearButton = app.buttons["clearButton"]

		textField.tap()
		textField.typeText("go\n")
		app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
		favoriteButton.tap()
		backButton.tap()
		clearButton.tap()
	}

	static func openGameDetailScreen() {
		let app = XCUIApplication()
		openGameScreen()
		addDefinition()
		openGameScreen()
		let cell = app.collectionViews.cells.children(matching: .other).element
		cell.tap()
	}
}
