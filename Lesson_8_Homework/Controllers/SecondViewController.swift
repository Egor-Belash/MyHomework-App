//
//  SecondViewController.swift
//  Lesson_8_Homework
//
//  Created by Egor on 26.01.26.
//

import UIKit

class SecondViewController: UIViewController {
    private let imageView = UIImageView()
    
    private let headerStackView = UIStackView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let houseLabel = UILabel()
    
    private let mainStackView = UIStackView()
    
    private let lightsStackView = UIStackView()
    private let lightsLabel = UILabel()
    private var onOffSwitch = UISegmentedControl()
    
    private let doorStackView = UIStackView()
    private let doorLabel = UILabel()
    private var lockUnlockSwitch = UISegmentedControl()
    
    private let acStackView = UIStackView()
    private let acLabel = UILabel()
    private var acOnOffSwitch = UISegmentedControl()
    
    private let temperatureStackView = UIStackView()
    private let temperatureLabel = UILabel()
    private let temperatureSlider = UISlider()
    private let temperatureDegreesLabel = UILabel()
    
    private let alarmButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        
        backToRootButton()
    }
    
    func setupViewProperties() {
        view.backgroundColor = .black
        imageView.image = UIImage(named: "image2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
    }
    
    func setupSubviews() {
        headerStackView.axis = .vertical
        headerStackView.spacing = 10
        headerStackView.alignment = .leading
        headerStackView.translatesAutoresizingMaskIntoConstraints = false


        titleLabel.text = "Welcome, User!"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        subTitleLabel.text = "Appartment control page"
        subTitleLabel.font = .systemFont(ofSize: 24, weight: .regular)
        
        houseLabel.text = "🏠"
        houseLabel.font = .systemFont(ofSize: 24, weight: .regular)
        
        [titleLabel, subTitleLabel, houseLabel].forEach {
            headerStackView.addArrangedSubview( $0 )
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
        }
        
        view.addSubview(headerStackView)
        headerStackView.setCustomSpacing(5, after: subTitleLabel)
        
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.alignment = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.layer.shadowOpacity = 0.15
        mainStackView.layer.shadowOffset = CGSize(width: 0, height: 10)
        mainStackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        view.addSubview(mainStackView)
        mainStackView.layer.cornerRadius = 10
        mainStackView.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
        [lightsLabel, doorLabel, acLabel, temperatureLabel].forEach {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupLightsStackView()
        setupDoorStackView()
        setupACStackView()
        setupTemperatureStackView()
        
        
        alarmButton.setTitle( "Alarm", for: .normal)
        alarmButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        alarmButton.tintColor = .red
        alarmButton.backgroundColor = .white
        alarmButton.layer.borderWidth = 0.5
        alarmButton.layer.borderColor = UIColor.black.cgColor
        alarmButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alarmButton)
    
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 50),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.widthAnchor.constraint(equalToConstant: 360),
            
            alarmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            alarmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alarmButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func setupLightsStackView() {
        lightsLabel.text = "Lights"
        
        let types = ["On", "Off"]
        onOffSwitch = UISegmentedControl(items: types)
        onOffSwitch.setWidth(100, forSegmentAt: 0)
        onOffSwitch.setWidth(100, forSegmentAt: 1)
        onOffSwitch.backgroundColor = UIColor.systemCyan.withAlphaComponent(0.3)
        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
        onOffSwitch.selectedSegmentIndex = 1
        
        mainStackView.addArrangedSubview( lightsStackView )
        lightsStackView.translatesAutoresizingMaskIntoConstraints = false
        lightsStackView.axis = .vertical
        lightsStackView.alignment = .leading
        lightsStackView.spacing = 5
        lightsStackView.addArrangedSubview( lightsLabel )
        lightsStackView.addArrangedSubview( onOffSwitch )
    }
    
    func setupDoorStackView() {
        doorLabel.text = "Door"
        
        let types2 = ["Lock", "Unlock"]
        lockUnlockSwitch = UISegmentedControl(items: types2)
        lockUnlockSwitch.setWidth(100, forSegmentAt: 0)
        lockUnlockSwitch.setWidth(100, forSegmentAt: 1)
        lockUnlockSwitch.backgroundColor = UIColor.systemCyan.withAlphaComponent(0.3)
        lockUnlockSwitch.translatesAutoresizingMaskIntoConstraints = false
        lockUnlockSwitch.selectedSegmentIndex = 0
        
        mainStackView.addArrangedSubview(doorStackView)
        doorStackView.translatesAutoresizingMaskIntoConstraints = false
        doorStackView.axis = .vertical
        doorStackView.alignment = .leading
        doorStackView.spacing = 5
        doorStackView.addArrangedSubview( doorLabel )
        doorStackView.addArrangedSubview( lockUnlockSwitch )
    }
    
    func setupACStackView() {
        acLabel.text = "A/C"
                
        let types3 = ["Auto", "On", "Off"]
        acOnOffSwitch = UISegmentedControl(items: types3)
        acOnOffSwitch.setWidth(100, forSegmentAt: 0)
        acOnOffSwitch.setWidth(100, forSegmentAt: 1)
        acOnOffSwitch.setWidth(100, forSegmentAt: 2)
        acOnOffSwitch.backgroundColor = UIColor.systemCyan.withAlphaComponent(0.3)
        acOnOffSwitch.translatesAutoresizingMaskIntoConstraints = false
        acOnOffSwitch.selectedSegmentIndex = 0
                
        mainStackView.addArrangedSubview(acStackView)
        acStackView.translatesAutoresizingMaskIntoConstraints = false
        acStackView.axis = .vertical
        acStackView.alignment = .leading
        acStackView.spacing = 5
        acStackView.addArrangedSubview( acLabel )
        acStackView.addArrangedSubview( acOnOffSwitch )
    }
    
    func setupTemperatureStackView() {
        temperatureLabel.text = "Temperature"
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(temperatureLabel)
        mainStackView.setCustomSpacing(3, after: temperatureLabel)
        
        temperatureStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(temperatureStackView)
        temperatureStackView.axis = .horizontal
        temperatureStackView.spacing = 10
        temperatureStackView.alignment = .center
        
        temperatureSlider.translatesAutoresizingMaskIntoConstraints = false
        temperatureStackView.addArrangedSubview(temperatureSlider)
        temperatureSlider.minimumValue = 18
        temperatureSlider.maximumValue = 25
        temperatureSlider.value = 20
        temperatureSlider.addTarget(self, action: #selector(sliderValueChanged), for: .touchUpInside)
        
        temperatureDegreesLabel.text = "20 °C"
        temperatureDegreesLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureDegreesLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        temperatureStackView.addArrangedSubview(temperatureDegreesLabel)

    }
    
    
    func backToRootButton() {
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToRoot))
        
    }
    
    // MARK: – Actions
    
    @objc private func backToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
        
    @objc private func sliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value.rounded())
        temperatureDegreesLabel.text = "\(value) °C"
        
    }
}
