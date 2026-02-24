//
//  MainViewControllerL16.swift
//  My Homework App
//
//  Created by Egor on 21.02.26.
//

import UIKit

class MainViewControllerL16: UIViewController {
    
    // MARK: – Properties
    
    // MARK: – Subviews
    
    private let touchView: TouchViewL16 = {
        let touchView = TouchViewL16()
        touchView.translatesAutoresizingMaskIntoConstraints = false
        return touchView
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
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
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(touchView)
        view.addSubview(backButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            touchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            touchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            touchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            touchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 35),

        ])
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }

    
}

