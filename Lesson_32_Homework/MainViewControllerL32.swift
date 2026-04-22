//
//  MainViewControllerL32.swift
//  My Homework App
//
//  Created by Egor on 21.04.2026.
//

import UIKit

final class MainViewControllerL32: UIViewController {
    
    // MARK: – Properties
    var userNumber = 0
    var randomNumber = Int.random(in: 0...100)
    var counter = 0
    var score = 0
    
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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Угадай число от 0 до 100"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 20, weight: .semibold)
        textField.placeholder = "Напиши число от 0 до 100"
        textField.borderStyle = .roundedRect
//        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Счёт: 0"
        label.textAlignment = .center
        return label
    }()
    
    private let numberOfAttemptsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Количество попыток: 0"
        label.textAlignment = .center
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Проверить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    // MARK: – Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        
        loadData()
        updateScoreLabel()
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        textField.delegate = self
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(scoreLabel)
        view.addSubview(numberOfAttemptsLabel)
        view.addSubview(playButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            scoreLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            numberOfAttemptsLabel.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -10),
            numberOfAttemptsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    // MARK: – Actions
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func playButtonTapped() {
        print(randomNumber)
        
        startGame()
    }
    
    private func startGame() {
        guard let text = textField.text, !text.isEmpty else {
            titleLabel.text = "❌ Ошибка!\nВведите число от 0 до 100"
            return
        }
        
        if let value = Int(text) {
            if value < 0 || value > 100 {
                titleLabel.text = "❌ Ошибка!\nВведите число от 0 до 100"
            } else {
                counter += 1
                titleLabel.text = "Вы ввели: \(value)"
                if value == randomNumber {
                    titleLabel.text = "🎉 Вы выиграли! 🎉"
                    
                    score += 10
                    UserDefaults.standard.set(score, forKey: "score")
                    updateScoreLabel()
                    
                    scoreLabel.text = "Счёт: \(score)"
                    showAlert(randomNumber, counter)
                } else if value > randomNumber {
                    titleLabel.text = "Загаданное число меньше вашего"
                } else {
                    titleLabel.text = "Загаданное число больше вашего"
                }
            }
        } else {
            titleLabel.text = "❌ Ошибка!\nВведите число"
        }
        numberOfAttemptsLabel.text = "Количество попыток: \(counter)"
    }
    
    private func resetGame() {
        randomNumber = Int.random(in: 0...100)
        counter = 0
        
        titleLabel.text = "Угадайте число от 0 до 100"
        numberOfAttemptsLabel.text = "Количество попыток: 0"
        textField.text = ""
    }
    
    private func showAlert(_ number: Int, _ attempts: Int) {
        let alert = UIAlertController(
            title: "🎉 Победа! 🎉",
            message: "Вы угадали число!\nЗагаданное число – \(number)\nКоличество попыток: \(attempts)",
            preferredStyle: .alert
        )
        
        let startAgain = UIAlertAction(title: "Начать заново", style: .default) { _ in
            self.resetGame()
        }
        
        let exit = UIAlertAction(title: "Выйти", style: .cancel) { _ in
            self.dismiss(animated: true)
        }
        
        alert.addAction(startAgain)
        alert.addAction(exit)
                        
        present(alert, animated: true)
    }
    
    private func loadData() {
        score = UserDefaults.standard.integer(forKey: "score")
    }
    
    private func updateScoreLabel() {
        scoreLabel.text = "Счёт: \(score)"
    }
    
}

extension MainViewControllerL32: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
