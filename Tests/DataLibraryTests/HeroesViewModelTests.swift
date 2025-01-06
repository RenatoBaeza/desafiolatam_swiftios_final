import XCTest
@testable import DataLibrary

final class HeroesViewModelTests: XCTestCase {
    var viewModel: HeroesViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HeroesViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertTrue(viewModel.heroes.isEmpty)
        XCTAssertNil(viewModel.selectedHero)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.error)
    }
} 