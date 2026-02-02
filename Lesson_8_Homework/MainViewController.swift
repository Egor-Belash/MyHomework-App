//
//  MainViewController.swift
//  Lesson_8_Homework
//
//  Created by Egor on 26.01.26.
//

import UIKit

class MainViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let label = UILabel()
    private let button1 = UIButton(type: .system)
    private let button2 = UIButton(type: .system)
    private let stackView = UIStackView()
    
    private let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    func setupViewProperties() {
        view.backgroundColor = .systemBackground
        imageView.image = UIImage(named: "image1_day-night")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
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
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.cornerRadius = 8
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.systemGray.cgColor
        backButton.layer.backgroundColor = UIColor.systemGray.cgColor
        backButton.layer.opacity = 0.9
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowRadius = 10
        backButton.layer.shadowOpacity = 1
        backButton.layer.shadowOffset = CGSize(width: 5, height: 10)
        
        backButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        view.addSubview(backButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 30)
            
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
    
    @objc func closeTapped() {
        dismiss(animated: true)
    }
}

