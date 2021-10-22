//
//  DictionarySwiftUIUITests.swift
//  DictionarySwiftUIUITests
//
//  Created by Vyacheslav Agarkov on 21.10.2021.
//

import XCTest

class TranslationViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        deleteApp()
        app = nil
        try super.tearDownWithError()
    }
    
    private func deleteApp() {
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
    
    private func addDefinition() {
        let textField = app.textFields["searchTextField"]
        textField.tap()
        textField.typeText("go\n")
        
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        
        let title = app.staticTexts["titleLabel"]
        XCTAssertEqual(title.label, "go")
        
        let favoriteButton = app.buttons["favoriteButton"]
        favoriteButton.tap()
        
        let backButton = app.buttons["backButton"]
        backButton.tap()
        
        let clearButton = app.buttons["clearButton"]
        clearButton.tap()
    }
    
    private func openGameScreen() {
        addDefinition()
        let tabBar = app.tabBars["Tab Bar"]
        let gameScreen = tabBar.buttons["game"]
        gameScreen.tap()
        tabBar.buttons["search"].tap()
        gameScreen.tap()
        
        let cell = app.collectionViews.cells.children(matching: .other).element
        cell.tap()
        cell.press(forDuration: 1.7)
    }
    
    func testClearButtonVisability() {
        let clearButton = app.buttons["clearButton"]
        
        XCTAssertFalse(clearButton.exists)
        
        let textField = app.textFields["searchTextField"]
        textField.tap()
        textField.typeText("go\n")
        
        XCTAssertTrue(clearButton.exists)
    }
    
    func testChangeLanguage() {
        let translateToLanguageButton = app.buttons["translateToLanguageButton"]
        
        translateToLanguageButton.tap()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        
        XCTAssertEqual(translateToLanguageButton.label, "ru")
    }
    
    func testOpenDetailScreenAndAddToFavorite() {
        let title = app.staticTexts["titleLabel"]
        
        addDefinition()
        
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        XCTAssertEqual(title.label, "go")
    }
    
    func testOpenGameScreen() {
        openGameScreen()
        let title = app.navigationBars.staticTexts["Translate the Word"]
        XCTAssertTrue(title.exists)
    }
    
    func testMessageVisability() {
        openGameScreen()
        
        let messageText = app.staticTexts["compareMessage"]
        XCTAssertFalse(messageText.exists)
        
        let submitButton = app.buttons["submitButton"]
        if !submitButton.isHittable {
            let coordinate: XCUICoordinate = submitButton.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        } else {
            submitButton.tap()
        }
        XCTAssertTrue(messageText.exists)
    }
    
    func testHintSelection() {
        openGameScreen()
        
        let hintLink = app.buttons["hintLink"]
        if !hintLink.isHittable {
            let coordinate: XCUICoordinate = hintLink.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        } else {
            hintLink.tap()
        }
        
        let title = app.staticTexts["titleLabel"]
        XCTAssertEqual(title.label, "go")
    }
}
