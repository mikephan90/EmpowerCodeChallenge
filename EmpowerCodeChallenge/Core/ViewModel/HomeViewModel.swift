//
//  HomeViewModel.swift
//  EmpowerCodeChallenge
//
//  Created by Mike Phan on 3/11/24.
//

import Foundation

class HomeViewModel {
    
    // Data model for the tableview and additional information view controller
    var beneficiaries: [Beneficiary] = []
    
    // Service to help decode and parse the data from the JSON file
    func fetchBenficiaries(completion: @escaping ([Beneficiary]?) -> Void) {
        if let path = Bundle.main.path(forResource: "Beneficiaries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let beneficiaries = try JSONDecoder().decode([Beneficiary].self, from: data)
                completion(beneficiaries)
            } catch {
                print("Error reading JSON file: \(error)")
                completion(nil)
            }
        } else {
            print("JSON file cannot be found.")
            completion(nil)
        }
    }
}
