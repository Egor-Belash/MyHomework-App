//
//  MainViewControllerL17.swift
//  My Homework App
//
//  Created by Egor on 1.03.26.
//

import UIKit

final class MainViewControllerL17: UIViewController {
    
    // MARK: – Properties
    private let step: CGFloat = 100
    
    // MARK: – Subviews
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let circle: UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .systemOrange
        circle.layer.cornerRadius = 50
        return circle
    }()
    
    private let buttonView: UIView = {
        let buttonView = UIView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.layer.borderWidth = 1
        buttonView.backgroundColor = .systemGray6
        return buttonView
    }()
    
    private let upButton: UIButton = {
        let button = UIButton()
        button.setTitle("Up", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let downButton: UIButton = {
        let button = UIButton()
        button.setTitle("Down", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Left", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Right", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 8

        return button
    }()
    
    // MARK: – Lifecycles
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
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        upButton.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        view.addSubview(circle)
        buttonView.addSubview(upButton)
        buttonView.addSubview(downButton)
        buttonView.addSubview(leftButton)
        buttonView.addSubview(rightButton)
        view.addSubview(buttonView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circle.heightAnchor.constraint(equalToConstant: 100),
            circle.widthAnchor.constraint(equalToConstant: 100),
            
            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            
            leftButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            leftButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 10),
            leftButton.widthAnchor.constraint(equalToConstant: 100),
            leftButton.heightAnchor.constraint(equalToConstant: 100),
            
            rightButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            rightButton.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 10),
            rightButton.widthAnchor.constraint(equalToConstant: 100),
            rightButton.heightAnchor.constraint(equalToConstant: 100),
            
            upButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 5),
            upButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -20),
            upButton.widthAnchor.constraint(equalToConstant: 100),
            upButton.heightAnchor.constraint(equalToConstant: 100),
            
            downButton.topAnchor.constraint(equalTo: upButton.bottomAnchor, constant: 5),
            downButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -20),
            downButton.widthAnchor.constraint(equalToConstant: 100),
            downButton.heightAnchor.constraint(equalToConstant: 100),
            
            
        ])
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func leftButtonTapped() {
        
        if circle.frame.minX - 100 < 0 {
            let distance = circle.frame.minX
            
            let animate = CABasicAnimation(keyPath: "position.x")
            animate.fromValue = circle.layer.position.x
            animate.toValue = circle.layer.position.x - distance
            animate.duration = 1
            animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            circle.layer.position.x -= distance
            
            circle.layer.add(animate, forKey: "leftButtonTapped")
            return
        }
        
        let animate = CABasicAnimation(keyPath: "position.x")
        animate.fromValue = circle.layer.position.x
        animate.toValue = circle.layer.position.x - step
        animate.duration = 1
        animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        circle.layer.position.x -= step
        
        circle.layer.add(animate, forKey: "leftButtonTapped")
    }
    
    @objc private func rightButtonTapped() {
        
        if circle.frame.maxX + 100 > view.frame.width {
            let distance = view.frame.width - circle.frame.maxX
            
            let animate = CABasicAnimation(keyPath: "position.x")
            animate.fromValue = circle.layer.position.x
            animate.toValue = circle.layer.position.x + distance
            animate.duration = 1
            animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            circle.layer.position.x += distance
            
            circle.layer.add(animate, forKey: "rightButtonTapped")
            return
        }
        
        let animate = CABasicAnimation(keyPath: "position.x")
        animate.fromValue = circle.layer.position.x
        animate.toValue = circle.layer.position.x + step
        animate.duration = 1
        animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        circle.layer.position.x += step
        
        circle.layer.add(animate, forKey: "rightButtonTapped")
    }
    
    @objc private func upButtonTapped() {
        
        if circle.frame.minY - 100 < backButton.frame.maxY {
            let distance = circle.frame.minY - backButton.frame.maxY
            
            let animate = CABasicAnimation(keyPath: "position.y")
            animate.fromValue = circle.layer.position.y
            animate.toValue = circle.layer.position.y - distance
            animate.duration = 1
            animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            circle.layer.position.y -= distance
            
            circle.layer.add(animate, forKey: "upButtonTapped")
            return
        }
        
        let animate = CABasicAnimation(keyPath: "position.y")
        animate.fromValue = circle.layer.position.y
        animate.toValue = circle.layer.position.y - step
        animate.duration = 1
        animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        circle.layer.position.y -= step
        
        circle.layer.add(animate, forKey: "upButtonTapped")
    }
    
    @objc private func downButtonTapped() {
        
        if circle.frame.maxY + 100 > buttonView.frame.minY {
            let distance = buttonView.frame.minY - (circle.frame.maxY)
            
            let animate = CABasicAnimation(keyPath: "position.y")
            animate.fromValue = circle.layer.position.y
            animate.toValue = circle.layer.position.y + distance
            animate.duration = 1
            animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            circle.layer.position.y += distance
            
            circle.layer.add(animate, forKey: "downButtonTapped")
            return
        }
        
        let animate = CABasicAnimation(keyPath: "position.y")
        animate.fromValue = circle.layer.position.y
        animate.toValue = circle.layer.position.y + step
        animate.duration = 1
        animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        circle.layer.position.y += step
        
        circle.layer.add(animate, forKey: "downButtonTapped")        
    }
    
}
