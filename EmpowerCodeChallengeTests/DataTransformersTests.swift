//
//  DataTransformersTests.swift
//  EmpowerCodeChallengeTests
//
//  Created by Mike Phan on 3/12/24.
//

import XCTest
@testable import EmpowerCodeChallenge

final class DataTransformersTests: XCTestCase {
    
    func testFormatPhoneNumber_ValidPhoneNumber() throws {
        let phoneNumber = "123-456-7890"
        let formattedPhoneNumber = formatPhoneNumber(phoneNumber)

        XCTAssertEqual(formattedPhoneNumber, "123-456-7890", "Formatted phone number should match the original phone number")
    }
    
    func testFormatPhoneNumber_InvalidPhoneNumber() throws {
        // When less than 10 digits check failure
        let phoneNumber = "123456789"
        let formattedPhoneNumber = formatPhoneNumber(phoneNumber)

        XCTAssertEqual(formattedPhoneNumber, "123456789", "Formatted phone number should match the original phone number since it's invalid")
    }
    
    func testConvertDateFormat_ValidDateString() throws {
        let dateString = "03122024"
        let formattedDate = convertDateFormat(dateString)
        
        XCTAssertEqual(formattedDate, "03/12/2024", "Formatted date should match the expected format")
    }
    
    func testConvertDateFormat_InvalidDateString() throws {
        // Invalid date format
        let dateString = "12345"
        let formattedDate = convertDateFormat(dateString)

        XCTAssertNil(formattedDate, "Formatted date should be nil for invalid date string")
    }
}
