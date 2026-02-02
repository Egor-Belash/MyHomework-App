//
//  MainViewControllerL10.swift
//  Lesson_8-9_Homework
//
//  Created by Egor on 31.01.26.
//

import UIKit

class MainViewControllerL10: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Lesson 10"
        label.textColor = .label
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button1: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Передача строки", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button2: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Передача класса", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupViewProperties() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        
        [label, button1, button2].forEach {
            view.addSubview($0)
            
            view.addSubview(backButton)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            backButton.widthAnchor.constraint(equalToConstant: 100),
                        
            
        ])
    }
    
    // MARK: – Actions
    
    @objc private func button1Tapped() {
        let vc = FirstViewControllerL10()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func button2Tapped() {
        let vc = SixthViewControllerL10()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func closeTapped() {
        dismiss(animated: true)
    }

}




