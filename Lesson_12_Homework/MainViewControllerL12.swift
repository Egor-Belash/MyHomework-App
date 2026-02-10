//
//  MainViewControllerL12.swift
//  My Homework App
//
//  Created by Egor on 8.02.26.
//

import UIKit

class MainViewControllerL12: UIViewController {
    
    // MARK: – Properties
    
    // MARK: – Subviews
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.layer.backgroundColor = UIColor.systemBlue.cgColor
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Lesson 12"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let button: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .lightGray
        return button
    }()
    
    // MARK: – Lyfecycles
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
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(backButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            backButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    
    @objc func buttonTapped() {
        let vc = SecondVCL12()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func closeTapped() {
        dismiss(animated: true)
    }
    
}

extension MainViewControllerL12: SecondVCL12Delegate {
    func didTapDoneButton(firstName: String, surname: String, lastName: String) {
        label.text = "Привет, \(firstName) \(surname) \(lastName)!"
    }
}



