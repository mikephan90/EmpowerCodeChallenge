//
//  CustomLabel.swift
//  EmpowerCodeChallenge
//
//  Created by Mike Phan on 3/12/24.
//

import UIKit

// Reusuable label component to help display data
class CustomLabel: UILabel {
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        self.font = UIFont.systemFont(ofSize: 14)
        
    }
}
