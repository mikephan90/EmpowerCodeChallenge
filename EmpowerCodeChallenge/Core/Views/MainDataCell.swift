//
//  DataTableViewCell.swift
//  EmpowerCodeChallenge
//
//  Created by Mike Phan on 3/11/24.
//

import UIKit

class MainDataCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "MainDataCell"
    
    // MARK: - Views
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var nameLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var designationLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var beneficiaryTypeLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        addLabelsToStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 30),
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func addLabelsToStackView() {
            addTitleLabel(with: "Name:")
            addDataLabel(label: nameLabel)
            
            addTitleLabel(with: "Designation:")
            addDataLabel(label: designationLabel)
            
            addTitleLabel(with: "Beneficiary Type:")
            addDataLabel(label: beneficiaryTypeLabel)
        }
    
    // MARK: - Helpers
    
    func addTitleLabel(with title: String) {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.text = title
        stackView.addArrangedSubview(titleLabel)
    }

    func addDataLabel(label: UILabel) {
        label.numberOfLines = 0
        stackView.addArrangedSubview(label)
    }

    // MARK: - Methods
    
    func configure(with viewModel: Beneficiary) {
        guard let designationCode = designationMap[viewModel.designationCode] else { return }
        
        if viewModel.middleName != nil {
            nameLabel.text = "\(viewModel.firstName) \(viewModel.middleName ?? "") \(viewModel.lastName)"
        } else {
            nameLabel.text = "\(viewModel.firstName) \(viewModel.lastName)"
        }
        
        designationLabel.text = "\(designationCode)"
        beneficiaryTypeLabel.text = "\(viewModel.beneType)"
    }
}
