//
//  AdditionalInfoViewController.swift
//  EmpowerCodeChallenge
//
//  Created by Mike Phan on 3/11/24.
//

import UIKit

class AdditionalInfoViewController: UIViewController {
    
    // MARK: - Properties

    private let viewModel: AdditionalInfoViewModel
    
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
    
    var ssnLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var dateOfBirthLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var phoneNumberLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var firstLineAddressLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var secondLineAddressLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var cityLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var zipCodeLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var stateCodeLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    var countryLabel: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    // MARK: - Inits
    
    init(viewModel: AdditionalInfoViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - UI
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Additional Information"
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        populateData()
        createInfoViews()
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        // ScrollView constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // StackView constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    // MARK: - Helpers
    
    private func addTitleLabel(with title: String) {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.text = title
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func addDataLabel(label: UILabel) {
        label.numberOfLines = 0
        stackView.addArrangedSubview(label)
        
        // Create spacing between pairs
        let spacingView = UIView()
        spacingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([spacingView.heightAnchor.constraint(equalToConstant: 4)])
        stackView.addArrangedSubview(spacingView)
    }
    
    /// Create title, data pairs to display information
    private func createInfoViews() {
        addTitleLabel(with: "Name:")
        addDataLabel(label: nameLabel)
        
        addTitleLabel(with: "Designation:")
        addDataLabel(label: designationLabel)
        
        addTitleLabel(with: "Beneficiary Type:")
        addDataLabel(label: beneficiaryTypeLabel)
        
        addTitleLabel(with: "SSN:")
        addDataLabel(label: ssnLabel)
        
        addTitleLabel(with: "Date of Birth:")
        addDataLabel(label: dateOfBirthLabel)
        
        addTitleLabel(with: "Phone Number:")
        addDataLabel(label: phoneNumberLabel)
        
        addTitleLabel(with: "Address:")
        addDataLabel(label: firstLineAddressLabel)
        checkSecondaryAddressLine()
        
        addTitleLabel(with: "City:")
        addDataLabel(label: cityLabel)
        
        addTitleLabel(with: "Zip Code:")
        addDataLabel(label: zipCodeLabel)
        
        addTitleLabel(with: "State Code:")
        addDataLabel(label: stateCodeLabel)
        
        addTitleLabel(with: "Country:")
        addDataLabel(label: countryLabel)
    }
    
    /// Populate data from the dependency injected data
    private func populateData() {
        nameLabel.text = viewModel.nameLabel
        designationLabel.text = viewModel.designationLabel
        beneficiaryTypeLabel.text = viewModel.beneficiary.beneType
        ssnLabel.text = viewModel.beneficiary.socialSecurityNumber
        dateOfBirthLabel.text = viewModel.dateOfBirth
        phoneNumberLabel.text = viewModel.phoneNumber
        firstLineAddressLabel.text = viewModel.beneficiary.beneficiaryAddress.firstLineMailing
        cityLabel.text = viewModel.beneficiary.beneficiaryAddress.city
        zipCodeLabel.text = viewModel.beneficiary.beneficiaryAddress.zipCode
        stateCodeLabel.text = viewModel.beneficiary.beneficiaryAddress.stateCode
        countryLabel.text = viewModel.beneficiary.beneficiaryAddress.country
    }
    
    /// Helper function to display a second address line - if it does not exist, don't render this at all
    private func checkSecondaryAddressLine() {
        if let secondaryAddressLine = viewModel.beneficiary.beneficiaryAddress.scndLineMailing {
            addDataLabel(label: secondLineAddressLabel)
            secondLineAddressLabel.text = "\(secondaryAddressLine)"
        }
    }
}
