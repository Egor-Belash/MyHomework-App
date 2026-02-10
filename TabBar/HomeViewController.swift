//
//  HomeViewController.swift
//  Lesson_8-9_Homework
//
//  Created by Egor on 28.01.26.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let label = UILabel()
    private let button1 = UIButton(type: .system)
    private let button2 = UIButton(type: .system)
    private let lesson12Button = UIButton(type: .system)
    private let stackView = UIStackView()
    
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
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "My Homework"
        label.textColor = .label
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        button1.setTitle("Lesson 8-9", for: .normal)
        button1.setTitleColor(.label, for: .normal)
        button1.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button1.addTarget(self, action: #selector(lesson89Tapped), for: .touchUpInside)
        
        button2.setTitle("Lesson 10", for: .normal)
        button2.setTitleColor(.label, for: .normal)
        button2.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button2.addTarget(self, action: #selector(lesson10Tapped), for: .touchUpInside)
        
        lesson12Button.setTitle("Lesson 12", for: .normal)
        lesson12Button.setTitleColor(.label, for: .normal)
        lesson12Button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        lesson12Button.addTarget(self, action: #selector(lesson12Tapped), for: .touchUpInside)
        
        
        
        [button1, button2, lesson12Button].forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addSubview(label)
        view.addSubview(stackView)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
    // MARK: – Actions
    
    @objc private func lesson89Tapped() {
        let vc = MainViewController()
        vc.hidesBottomBarWhenPushed = true
        let firstNav = UINavigationController(rootViewController: vc)
        firstNav.modalPresentationStyle = .fullScreen
        present(firstNav, animated: true)
    }
    
    @objc private func lesson10Tapped() {
        let vc = MainViewControllerL10()
        vc.hidesBottomBarWhenPushed = true
        let firstNav = UINavigationController(rootViewController: vc)
        firstNav.modalPresentationStyle = .fullScreen
        present(firstNav, animated: true)
    }
    
    @objc private func lesson12Tapped() {
        let vc = MainViewControllerL12()
        vc.hidesBottomBarWhenPushed = true
        let firstNav = UINavigationController(rootViewController: vc)
        firstNav.modalPresentationStyle = .fullScreen
        present(firstNav, animated: true)
    }
}


