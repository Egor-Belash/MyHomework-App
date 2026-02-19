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
    private let lesson13Button = UIButton(type: .system)
    private let lesson14Button = UIButton(type: .system)
    private let lesson15Button = UIButton(type: .system)
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
        
        lesson13Button.setTitle("Lesson 13", for: .normal)
        lesson13Button.setTitleColor(.label, for: .normal)
        lesson13Button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        lesson13Button.addTarget(self, action: #selector(lesson13Tapped), for: .touchUpInside)
        
        lesson14Button.setTitle("Lesson 14", for: .normal)
        lesson14Button.setTitleColor(.label, for: .normal)
        lesson14Button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        lesson14Button.addTarget(self, action: #selector(lesson14Tapped), for: .touchUpInside)
        
        lesson15Button.setTitle("Lesson 15", for: .normal)
        lesson15Button.setTitleColor(.label, for: .normal)
        lesson15Button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        lesson15Button.addTarget(self, action: #selector(lesson15Tapped), for: .touchUpInside)
        
        
        
        [button1, button2, lesson12Button, lesson13Button, lesson14Button, lesson15Button].forEach {
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
    
    @objc private func lesson13Tapped() {
        let vc = MainViewControllerL13()
        vc.hidesBottomBarWhenPushed = true
        let firstNav = UINavigationController(rootViewController: vc)
        firstNav.modalPresentationStyle = .fullScreen
        present(firstNav, animated: true)
    }
    
    @objc private func lesson14Tapped() {
        let vc = MainViewControllerL14()
        vc.hidesBottomBarWhenPushed = true
        let firstNav = UINavigationController(rootViewController: vc)
        firstNav.modalPresentationStyle = .fullScreen
        present(firstNav, animated: true)
    }
    
    @objc private func lesson15Tapped() {
        let vc = MainViewControllerL15()
        vc.hidesBottomBarWhenPushed = true
        let firstNav = UINavigationController(rootViewController: vc)
        firstNav.modalPresentationStyle = .fullScreen
        present(firstNav, animated: true)
    }
}


