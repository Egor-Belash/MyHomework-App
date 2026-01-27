//
//  SecondTabBarVC.swift
//  Lesson_8_Homework
//
//  Created by Egor on 27.01.26.
//

import UIKit

class SecondTabBarVC: UIViewController {
    
    private let label = UILabel()
    
    private let clockLabel = UILabel()
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    func setupViewProperties() {
        view.backgroundColor = .systemRed
    }
    
    func setupSubviews() {
        label.text = "Current Time:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        setupClock()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            clockLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clockLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label.bottomAnchor.constraint(equalTo: clockLabel.topAnchor, constant: -5),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ])
    }
    
    private func setupClock() {
        clockLabel.font = .systemFont(ofSize: 50, weight: .bold)
        clockLabel.textColor = .white
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clockLabel)
        
        updateClock()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateClock),
            userInfo: nil,
            repeats: true
        )
    }
    
    
    
    // MARK: – Actions
    
    @objc private func updateClock() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "HH:mm:ss"
        clockLabel.text = formatter.string(from: Date())
    }
    
    deinit {
        timer?.invalidate()
    }
}
