//
//  MainDataCellTests.swift
//  EmpowerCodeChallengeTests
//
//  Created by Mike Phan on 3/12/24.
//

import XCTest
@testable import EmpowerCodeChallenge

final class MainDataCellTests: XCTestCase {
    
    var cell: MainDataCell!
    
    override func setUpWithError() throws {
        cell = MainDataCell(style: .default, reuseIdentifier: "MainDataCell")
    }
    
    override func tearDownWithError() throws {
        cell = nil
    }
    
    func testCellConfiguration() throws {
        let beneficiary = Beneficiary(
            lastName: "Doe",
            firstName: "John",
            designationCode: "P",
            beneType: "Spouse",
            socialSecurityNumber: "XXXXX6789",
            dateOfBirth: "01011990",
            middleName: nil,
            phoneNumber: "1234567890",
            beneficiaryAddress: Address(
                firstLineMailing: "123 Main St",
                scndLineMailing: nil,
                city: "City",
                zipCode: "12345",
                stateCode: "NY",
                country: "US"
            ))
        
        cell.configure(with: beneficiary)

        XCTAssertEqual(cell.nameLabel.text, "John Doe")
        XCTAssertEqual(cell.designationLabel.text, "Primary")
        XCTAssertEqual(cell.beneficiaryTypeLabel.text, "Spouse")
    }
    
}
