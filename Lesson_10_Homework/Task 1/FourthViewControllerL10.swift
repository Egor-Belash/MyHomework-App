//
//  FourthViewControllerL10.swift
//  Lesson_8-9_Homework
//
//  Created by Egor on 31.01.26.
//

import UIKit

class FourthViewControllerL10: UIViewController {
    
    var someText: String = ""
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Lesson 10"
        label.textColor = .label
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelNumber: UILabel = {
        let label = UILabel()
        label.text = "Screen 4 \n С помощью свойства"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        label.text = someText
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view.addSubview(labelNumber)
        view.addSubview(label)
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelNumber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 100),

            
        ])
    }
    
    // MARK: – Actions
    
    @objc private func buttonTapped() {
        let vc = FifthViewControllerL10(text: someText)
        navigationController?.pushViewController(vc, animated: true)
    }
}

