//
//  UserInfoViewController.swift
//  My Homework App
//
//  Created by Egor on 13.04.2026.
//

import UIKit

final class UserInfoViewController: UIViewController {
    
    // MARK: – Properties
    private let user: UserModel
    
    // MARK: – Subviews
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: – INIT
    init(user: UserModel) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(label)
        
        setupTextIntoLabels()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: – Actions
    private func setupTextIntoLabels() {
        nameLabel.text = user.name
        label.text = """
            \(user.username)
            
            Phone:
            \(user.phone)
            
            Email: 
            \(user.email)
            
            Website: 
            \(user.website)
            
            Address: 
            \(user.address.city), street \(user.address.street), \(user.address.suite), zeepcode: \(user.address.zipcode)
            Geo: \(user.address.geo.lat) \(user.address.geo.lng)
            
            Company name: 
            \(user.company.name)
            \(user.company.bs)
            
            Catch phrase: 
            \(user.company.catchPhrase)
                
            
            """
        
        
    }
    
}
