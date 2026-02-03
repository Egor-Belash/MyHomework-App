//
//  CalculatorViewController.swift
//  Lesson_8-9_Homework
//
//  Created by Egor on 28.01.26.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: – StackViews
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let fourthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let fifthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    private let zeroStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: – Buttons
    // 1
    private let acButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "AC", for: .normal)
        button.tintColor = .black
        button.layer.backgroundColor = UIColor(named: "Color1")?.cgColor
        return button
    }()
    
    private let plusMinusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "+/-", for: .normal)
        button.tintColor = .black
        button.layer.backgroundColor = UIColor(named: "Color1")?.cgColor
        return button
    }()
    
    private let percentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "%", for: .normal)
        button.tintColor = .black
        button.layer.backgroundColor = UIColor(named: "Color1")?.cgColor
        return button
    }()
    
    private let divisionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "/", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color2")?.cgColor
        return button
    }()
    
    // 2
    
    private let numberSevenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "7", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let numberEightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "8", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let numberNineButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "9", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let multiplicationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "*", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color2")?.cgColor
        return button
    }()
    
    // 3
    
    private let numberFourButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "4", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let numberFiveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "5", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let numberSixButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "6", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let substractionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "-", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color2")?.cgColor
        return button
    }()
    
    // 4
    
    private let numberOneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "1", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let numberTwoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "2", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let numberThreeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "3", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let additionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "+", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color2")?.cgColor
        return button
    }()
    
    // 5
    
    private let numberZeroButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "0", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let commaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( ",", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color3")?.cgColor
        return button
    }()
    
    private let equalsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "=", for: .normal)
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(named: "Color2")?.cgColor
        return button
    }()
    
    // MARK: – Label
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupViewProperties() {
        view.backgroundColor = .black
    }
    
    private func setupSubviews() {
        [acButton, plusMinusButton, percentButton, divisionButton,
         numberSevenButton, numberEightButton, numberNineButton, multiplicationButton,
         numberFourButton, numberFiveButton, numberSixButton, substractionButton,
         numberOneButton, numberTwoButton, numberThreeButton, additionButton,
         numberZeroButton, commaButton, equalsButton].forEach {
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
            $0.layer.cornerRadius = 40
        }
        
        [numberSevenButton, numberEightButton, numberNineButton,
         numberFourButton, numberFiveButton, numberSixButton,
         numberOneButton, numberTwoButton, numberThreeButton,
         numberZeroButton, commaButton].forEach {
            $0.addTarget(self, action: #selector(numberTapped), for: .touchUpInside)
        }
        
        [divisionButton, multiplicationButton, substractionButton, additionButton].forEach {
            $0.addTarget(self, action: #selector(operationTapped), for: .touchUpInside)
        }
        
        
        acButton.addTarget(self, action: #selector(acButtonTapped), for: .touchUpInside)
        
        [firstStackView, secondStackView, thirdStackView, fourthStackView, fifthStackView].forEach {
            mainStackView.addArrangedSubview( $0 )
        }
        
        [acButton, plusMinusButton, percentButton, divisionButton].forEach {
            firstStackView.addArrangedSubview( $0 )
        }
        
        [numberSevenButton, numberEightButton, numberNineButton, multiplicationButton].forEach {
            secondStackView.addArrangedSubview( $0 )
        }
        
        [numberFourButton, numberFiveButton, numberSixButton, substractionButton].forEach {
            thirdStackView.addArrangedSubview( $0 )
        }
        
        [numberOneButton, numberTwoButton, numberThreeButton, additionButton].forEach {
            fourthStackView.addArrangedSubview( $0 )
        }
        
        zeroStackView.addArrangedSubview(numberZeroButton)
        [zeroStackView, commaButton, equalsButton].forEach {
            fifthStackView.addArrangedSubview( $0 )
        }
        
        commaButton.widthAnchor.constraint(equalTo: equalsButton.widthAnchor).isActive = true
        zeroStackView.widthAnchor.constraint(equalTo: commaButton.widthAnchor, multiplier: 2).isActive = true
        
        view.addSubview(mainStackView)
        view.addSubview(resultLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            resultLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
                        
        ])
    }
    
    // MARK: – Actions
    
    @objc private func numberTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        if resultLabel.text == "0" {
            resultLabel.text = number
        } else {
            resultLabel.text! += number
        }
        
        
    }
    
    @objc private func operationTapped(_ sender: UIButton) {

    }
    
    
    
    
    @objc private func acButtonTapped() {
        resultLabel.text = "0"
    }
    
    
    

}

