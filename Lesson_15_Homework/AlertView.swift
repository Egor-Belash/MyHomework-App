//
//  AlertView.swift
//  My Homework App
//
//  Created by Egor on 18.02.26.
//

import UIKit

protocol AlertViewDelegate: AnyObject {
    func didTapExitButton()
}

class AlertView: UIView {
    
    // MARK: – Properties
    weak var delegate: AlertViewDelegate?
   
    // MARK: – Subviews
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Внимание!"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private let secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Вы собираетесь покинуть эту страницу. \nУверены, что хотите продолжить?"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let stayButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Остаться", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.shadowColor = UIColor.label.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 8
        
        return button
    }()

    private let exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Выйти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.layer.shadowColor = UIColor.label.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 8
        return button
    }()


    // MARK: – INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupViewProperties() {
        backgroundColor = .systemBackground
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 8
        layer.cornerRadius = 16
    }

    private func setupSubviews() {
        stayButton.addTarget(self, action: #selector(stayButtonTapped), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)

        addSubview(label)
        addSubview(secondLabel)
        buttonStackView.addArrangedSubview(stayButton)
        buttonStackView.addArrangedSubview(exitButton)
        addSubview(buttonStackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),

            secondLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            secondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            secondLabel.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -10),

            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40),
            
        ])
   
       
    }
   
    @objc private func stayButtonTapped() {
        removeFromSuperview()
    }
   
    @objc private func exitButtonTapped() {
        delegate?.didTapExitButton()
    }

}

