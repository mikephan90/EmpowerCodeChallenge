//
//  AdditionalInformationViewModel.swift
//  EmpowerCodeChallenge
//
//  Created by Mike Phan on 3/12/24.
//

class AdditionalInfoViewModel {
    
    // MARK: -  Properties
    
    let beneficiary: Beneficiary
    
    
    // MARK: - View Labels
    
    var nameLabel: String {
        if let middleName = beneficiary.middleName {
            return "\(beneficiary.firstName) \(middleName) \(beneficiary.lastName)"
        } else {
            return "\(beneficiary.firstName) \(beneficiary.lastName)"
        }
    }
    
    var designationLabel: String? {
        return designationMap[beneficiary.designationCode]
    }
    
    var dateOfBirth: String? {
        return convertDateFormat(beneficiary.dateOfBirth)
    }
    
    var phoneNumber: String {
        return formatPhoneNumber(beneficiary.phoneNumber)
    }
    
    // MARK: - Inits
    
    init(beneficiary: Beneficiary) {
        self.beneficiary = beneficiary
    }
}
