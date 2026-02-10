//
//  SecondVCL12.swift
//  My Homework App
//
//  Created by Egor on 8.02.26.
//

import UIKit

protocol SecondVCL12Delegate: AnyObject {
    func didTapDoneButton(firstName: String, surname: String, lastName: String)
}

class SecondVCL12: UIViewController {
    
    // MARK: – Properties
    
    weak var delegate: SecondVCL12Delegate?
    
    private var name: String = ""
    private var surname: String = ""
    private var lastName: String = ""
    
    // MARK: – Subviews
    private let textField1: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ваше имя"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let textField2: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ваша фамилия"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let textField3: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ваше отчество"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    private let button: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
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
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(textField3)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(stackView)
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            
        ])
    }
    
    @objc private func buttonTapped() {
        delegate?.didTapDoneButton(
            firstName: textField1.text ?? "",
            surname: textField2.text ?? "",
            lastName: textField3.text ?? ""
        )
        navigationController?.popViewController(animated: true)
        
    }
    
}
