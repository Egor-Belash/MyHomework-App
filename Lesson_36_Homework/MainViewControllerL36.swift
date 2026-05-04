//
//  MainViewControllerL36.swift
//  My Homework App
//
//  Created by Egor on 04.05.2026.
//

import UIKit

final class MainViewControllerL36: UIViewController {
    
    // MARK: – Properties
    private var presenter: MainL36Presenter?

    // MARK: – Subviews
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // MARK: – Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        
        presenter = MainL36Presenter(view: self)
        presenter?.viewDidLoad()
        
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        minusButton.addTarget(self, action: #selector(minusButton1Tapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButton1Tapped), for: .touchUpInside)
        view.addSubview(label)
        view.addSubview(minusButton)
        view.addSubview(plusButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            minusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            minusButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            minusButton.widthAnchor.constraint(equalToConstant: 50),
            
            plusButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: – Actions
    @objc private func minusButton1Tapped() {
        presenter?.didTapDecrease()
    }
    
    @objc private func plusButton1Tapped() {
        presenter?.didTapIncrease()
    }
    
}

extension MainViewControllerL36: MainViewControllerL36Protocol {
    func setValue(_ value: String) {
        label.text = value
    }
    
    
}

