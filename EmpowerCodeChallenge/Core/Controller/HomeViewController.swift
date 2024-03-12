//
//  HomeViewController.swift
//  EmpowerCodeChallenge
//
//  Created by Mike Phan on 3/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel = HomeViewModel()
    
    private var beneficiaries: [Beneficiary] {
        return viewModel.beneficiaries
    }
    
    // MARK: - Views
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MainDataCell.self, forCellReuseIdentifier: MainDataCell.identifier)
        
        return tableView
    }()
    
    // MARK: - Viewcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - UI
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Home"
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Methods
    
    private func fetchData() {
        viewModel.fetchBenficiaries { [weak self] beneficiaries in
            guard let self, let beneficiaries = beneficiaries else { return }
            
            viewModel.beneficiaries = beneficiaries
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainDataCell.identifier, for: indexPath) as? MainDataCell else {
            return UITableViewCell()
        }
        
        let viewModel = beneficiaries[indexPath.row]
        
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beneficiaries.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewModel = AdditionalInfoViewModel(beneficiary: beneficiaries[indexPath.row])
        let vc = AdditionalInfoViewController(viewModel: viewModel)
        vc.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

