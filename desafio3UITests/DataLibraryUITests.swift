import XCTest

final class DataLibraryUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testMainNavigation() throws {
        // Test navigation to Heroes View
        let newViewButton = app.buttons["New View"]
        XCTAssertTrue(newViewButton.exists)
        newViewButton.tap()
        
        // Verify Heroes View loaded
        XCTAssertTrue(app.navigationBars["Heroes"].exists)
        
        // Go back to main view
        app.buttons["Back"].tap()
        
        // Test navigation to User Elements View
        let userElementsButton = app.buttons["User Elements View"]
        XCTAssertTrue(userElementsButton.exists)
        userElementsButton.tap()
        
        // Verify User Elements View loaded
        XCTAssertTrue(app.navigationBars["User Elements"].exists)
    }
} 