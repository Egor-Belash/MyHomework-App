//
//  AddingView.swift
//  My Homework App
//
//  Created by Egor on 22.03.26.
//

import UIKit

protocol AddingViewDelegate: AnyObject {
    func didAddCity(name: String, timeZone: String)
    func showAlert(title: String, message: String)
}

final class AddingView: UIView {
    
    // MARK: – Properties
    weak var delegate: AddingViewDelegate?
    private let timeZones = ["UTC -12", "UTC -11", "UTC -10", "UTC -9", "UTC -7", "UTC -6", "UTC -5", "UTC -3", "UTC -2", "UTC -1", "UTC +0", "UTC +1", "UTC +2", "UTC +3", "UTC +4", "UTC +5", "UTC +6", "UTC +7", "UTC +8", "UTC +9", "UTC +10", "UTC +11", "UTC +12", "UTC +13", "UTC +14"]
    
    private var cityName: String = ""
    private var cityTimeZone: String = "UTC +0"

    
    // MARK: – Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добавление города"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Укажите город для добавления"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private let cityTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Например: Москва"
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        return textField
    }()
    
    private let timeZoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выберите часовой пояс города"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private let timeZonePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
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
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.4
    }
    
    private func setupSubviews() {
        cityTextField.delegate = self
        
        timeZonePicker.dataSource = self
        timeZonePicker.delegate = self
        timeZonePicker.selectRow(10, inComponent: 0, animated: false)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        addSubview(titleLabel)
        addSubview(cityLabel)
        addSubview(cityTextField)
        addSubview(timeZoneLabel)
        addSubview(timeZonePicker)
        addSubview(saveButton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5),
            cityTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cityTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cityTextField.heightAnchor.constraint(equalToConstant: 44),
            
            timeZoneLabel.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 20),
            timeZoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            timeZonePicker.topAnchor.constraint(equalTo: timeZoneLabel.bottomAnchor, constant: 5),
            timeZonePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timeZonePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timeZonePicker.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -10),
            
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    // MARK: – Actioins
    @objc private func saveButtonTapped() {
        if !cityName.isEmpty {
            delegate?.didAddCity(name: cityName, timeZone: cityTimeZone)
            print(cityTimeZone)
            cityTextField.text = ""
            cityName = ""
            cityTimeZone = "UTC +0"
            timeZonePicker.selectRow(10, inComponent: 0, animated: false)
        } else {
            delegate?.showAlert(title: "Укажите город", message: "Необходимо указать название города и выбрать часовой пояс")
        }
    }
}

// MARK: – UITextFieldDelegate
extension AddingView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        cityName = textField.text ?? ""
    }
}

// MARK: – UIPickerViewDataSource
extension AddingView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        timeZones.count
    }
}

// MARK: – UIPickerViewDelegate
extension AddingView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        timeZones[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityTimeZone = timeZones[row]
    }
}
