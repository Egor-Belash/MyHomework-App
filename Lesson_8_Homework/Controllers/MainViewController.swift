//
//  MainViewController.swift
//  Lesson_8_Homework
//
//  Created by Egor on 26.01.26.
//

import UIKit

class MainViewController: UIViewController {
    
    private let label = UILabel()
    private let button1 = UIButton(type: .system)
    private let button2 = UIButton(type: .system)
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    func setupViewProperties() {
        view.backgroundColor = .systemBackground
    }
    
    func setupSubviews() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Привет!"
        label.textColor = .label
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        button1.setTitle("My Home Control", for: .normal)
        button1.setTitleColor(.label, for: .normal)
        button1.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button1.addTarget(self, action: #selector(pushTapped), for: .touchUpInside)
        
        button2.setTitle("Product Card", for: .normal)
        button2.setTitleColor(.label, for: .normal)
        button2.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button2.addTarget(self, action: #selector(pushProductCard), for: .touchUpInside)
        
        [button1, button2].forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addSubview(label)
        view.addSubview(stackView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
    // MARK: – Actions
    
    @objc private func pushTapped() {
        let vc = ViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pushProductCard() {
        let vc = FourthViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

