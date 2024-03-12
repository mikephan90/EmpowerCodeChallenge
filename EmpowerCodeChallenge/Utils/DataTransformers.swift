//
//  DataTransformers.swift
//  EmpowerCodeChallenge
//
//  Created by Mike Phan on 3/12/24.
//

import UIKit

let designationMap: [String: String] = [
    "P": "Primary",
    "C": "Contingent",
]

func formatPhoneNumber(_ phoneNumber: String) -> String {
    // Remove any non-numeric characters from the phone number
    let cleanedPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    
    // Check if the cleaned phone number has at least 10 digits
    guard cleanedPhoneNumber.count >= 10 else {
        return phoneNumber // Return the original phone number if it's not valid
    }
    
    // Split the cleaned phone number into groups of digits
    let areaCode = String(cleanedPhoneNumber.prefix(3))
    let firstPart = String(cleanedPhoneNumber.dropFirst(3).prefix(3))
    let secondPart = String(cleanedPhoneNumber.dropFirst(6).prefix(4))
    
    // Create the formatted phone number
    let formattedPhoneNumber = "\(areaCode)-\(firstPart)-\(secondPart)"
    
    return formattedPhoneNumber
}

func convertDateFormat(_ dateString: String) -> String? {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "MMddyyyy"
    
    if let date = inputFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MM/dd/yyyy"
        return outputFormatter.string(from: date)
    } else {
        return nil
    }
}
