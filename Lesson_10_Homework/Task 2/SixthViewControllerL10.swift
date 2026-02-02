//
//  SixthViewController.swift
//  Lesson_8-9_Homework
//
//  Created by Egor on 31.01.26.
//

import UIKit

class SixthViewControllerL10: UIViewController {
    
    private let user = UserL10(name: "Vadim", surname: "Severnyakov", age: 34)
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Передача информации о пользователе"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let button: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
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
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 100),

            
        ])
    }
    
    // MARK: – Actions
    
    @objc private func buttonTapped() {
        let vc = SeventhViewControllerL10(user: user)
        navigationController?.pushViewController(vc, animated: true)
    }
}




