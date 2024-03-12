//
//  InfoView.swift
//  EmpowerCodeChallenge
//
//  Created by Mike Phan on 3/12/24.
//

import UIKit

class InfoView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    init(title: String, data: String) {
        super.init(frame: .zero)
        setupView()
        titleLabel.text = title
        dataLabel.text = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(dataLabel)
    }
    
}
