//
//  ThirdViewController.swift
//  Lesson_8_Homework
//
//  Created by Egor on 26.01.26.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let imageView = UIImageView()
    
    private let headingLabel = UILabel()
    
    private let stackView = UIStackView()
    private let usernameLabel = UILabel()
    private let usernameTextField = UITextField()
    private let passwordLabel = UILabel()
    private let passwordTextField = UITextField()
    private let confirmPasswordLabel = UILabel()
    private let confirmPasswordTextField = UITextField()
    
    private let saveButton = UIButton(type: .system)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        }
    
    func setupViewProperties() {
        view.backgroundColor = .systemBackground
        imageView.image = UIImage(named: "image3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        
    }
    
    func setupSubviews() {
        headingLabel.text = "Registration Form"
        headingLabel.font = .systemFont(ofSize: 30, weight: .bold)
        headingLabel.textColor = .white
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headingLabel)
        
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .fill
        stackView.layer.cornerRadius = 10
        stackView.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        stackView.layer.shadowOpacity = 0.15
        stackView.layer.shadowOffset = CGSize(width: 0, height: 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        stackView.isLayoutMarginsRelativeArrangement = true
        view.addSubview(stackView)
                
        usernameLabel.text = "Username"
        
        usernameTextField.placeholder = "Please enter your username"
        
        passwordLabel.text = "Password"
        
        passwordTextField.placeholder = "Please enter your password"
        
        confirmPasswordLabel.text = "Confirm Password"
        
        confirmPasswordTextField.placeholder = "Please confirm your password"
        
        [usernameLabel, passwordLabel, confirmPasswordLabel].forEach {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
        }
        
        [usernameTextField, passwordTextField, confirmPasswordTextField].forEach {
            $0.borderStyle = .roundedRect
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            
        }
        
        [usernameLabel, usernameTextField, passwordLabel, passwordTextField, confirmPasswordLabel, confirmPasswordTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview( $0 )
        }
        
        stackView.setCustomSpacing(5, after: usernameLabel)
        stackView.setCustomSpacing(5, after: passwordLabel)
        stackView.setCustomSpacing(5, after: confirmPasswordLabel)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        saveButton.tintColor = .black
        saveButton.backgroundColor = .white
        saveButton.layer.borderWidth = 0.5
        saveButton.layer.borderColor = UIColor.black.cgColor
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            headingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 90),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 360),
            
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    @objc private func saveButtonTapped() {
        dismiss(animated: true)
    }
    
}
