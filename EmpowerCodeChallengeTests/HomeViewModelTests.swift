//
//  HomeViewModelTests.swift
//  EmpowerCodeChallengeTests
//
//  Created by Mike Phan on 3/11/24.
//

import XCTest
@testable import EmpowerCodeChallenge

final class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockViewModel: MockHomeViewModel!
    var cell: MainDataCell!
    
    override func setUpWithError() throws {
        viewModel = HomeViewModel()
        mockViewModel = MockHomeViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockViewModel = nil
    }
    
    // MARK: - ViewModel Tests
    
    func testBeneficiariesState() throws {
        let beneficiaries = viewModel.beneficiaries
        XCTAssertTrue(beneficiaries.isEmpty, "This should be empty since nothing has been fetched and stored to it yet")
    }
    
    func testFetchBeneficiaries_success() throws {
        let expectation = expectation(description: "Fetching beneficiaries")
        viewModel.fetchBenficiaries { beneficiaries in
            XCTAssertNotNil(beneficiaries, "Beneficiaries shoudl not be nil")
            XCTAssertTrue(beneficiaries!.count > 0, "There should be at least one beneficiary")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchBenficiaries_failure() throws {
        mockViewModel.shouldFailFetch = true
        
        let expectation = expectation(description: "Fetching beneficiaries")
        
        mockViewModel.fetchBenficiaries { beneficiaries in
            XCTAssertNil(beneficiaries, "Beneficiaries should be nil for failed fetch")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

// Mock class to create a mock of the HomeViewModel for data fetch testing
class MockHomeViewModel: HomeViewModel {
    var shouldFailFetch: Bool = false
    
    override func fetchBenficiaries(completion: @escaping ([Beneficiary]?) -> Void) {
        if shouldFailFetch {
            completion(nil)
        } else {
            let mockBeneficiaries: [Beneficiary] = []
            completion(mockBeneficiaries)
        }
    }
}
