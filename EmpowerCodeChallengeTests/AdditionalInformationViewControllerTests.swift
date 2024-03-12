//
//  AdditionalInformationViewControllerTests.swift
//  EmpowerCodeChallengeTests
//
//  Created by Mike Phan on 3/12/24.
//

import XCTest

import XCTest
@testable import EmpowerCodeChallenge

final class AdditionalInfoViewControllerTests: XCTestCase {
    
    var viewController: AdditionalInfoViewController!

    override func setUpWithError() throws {
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
        
        let viewModel = AdditionalInfoViewModel(beneficiary: beneficiary)
        viewController = AdditionalInfoViewController(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        viewController = nil
    }
    
    func testViewDidLoad() throws {
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.title, "Additional Information")
    }
    
    func testUIContentPopulation() throws {
        viewController.viewDidLoad()
        
        XCTAssertEqual(viewController.nameLabel.text, "John Doe")
        XCTAssertEqual(viewController.designationLabel.text, "Primary")
        XCTAssertEqual(viewController.beneficiaryTypeLabel.text, "Spouse")
        XCTAssertEqual(viewController.ssnLabel.text, "XXXXX6789")
        XCTAssertEqual(viewController.dateOfBirthLabel.text, "01/01/1990")
        XCTAssertEqual(viewController.phoneNumberLabel.text, "123-456-7890")
        XCTAssertEqual(viewController.firstLineAddressLabel.text, "123 Main St")
        XCTAssertEqual(viewController.secondLineAddressLabel.text, nil)
        XCTAssertEqual(viewController.cityLabel.text, "City")
        XCTAssertEqual(viewController.zipCodeLabel.text, "12345")
        XCTAssertEqual(viewController.stateCodeLabel.text, "NY")
        XCTAssertEqual(viewController.countryLabel.text, "US")
    }
}
