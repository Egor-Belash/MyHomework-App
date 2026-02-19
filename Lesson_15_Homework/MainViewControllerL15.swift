//
//  MainViewControllerL15.swift
//  My Homework App
//
//  Created by Egor on 18.02.26.
//

import UIKit

class MainViewControllerL15: UIViewController {
   
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Уведомление", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.shadowColor = UIColor.label.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 8
        return button
    }()
    
    private let alert: AlertView = {
        let alert = AlertView()
        alert.translatesAutoresizingMaskIntoConstraints = false
        return alert
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
    
        view.addSubview(button)
    }
   
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 230),
       
        ])
       
    }
   
    @objc private func buttonTapped() {
        alert.delegate = self
        view.addSubview(alert)
        NSLayoutConstraint.activate([
            alert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alert.widthAnchor.constraint(equalToConstant: 350),
            alert.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
   
}

extension MainViewControllerL15: AlertViewDelegate {
    func didTapExitButton() {
        dismiss(animated: true)
    }
    
}
