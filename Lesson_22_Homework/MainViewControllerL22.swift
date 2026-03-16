//
//  MainViewControllerL22.swift
//  My Homework App
//
//  Created by Egor on 15.03.26.
//

import UIKit
import Photos

final class MainViewControllerL22: UIViewController {
    
    // MARK: – Properties
    private let cities = [
        "Минск",
        "Москва",
        "Киев",
        "Милан",
        "Париж",
        "Берлин",
        "Рим",
        "Лондон",
        "Токио",
        "Нью-Йорк",
        "Прага",
        "Варшава",
        "Вильнюс",
        "Тбилиси",
        "Ереван",
        "Стамбул",
        "Мадрид",
        "Лиссабон",
        "Вена",
        "Амстердам",
        "Стокгольм",
        "Осло",
        "Хельсинки",
        "Копенгаген",
        "Барселона",
        "Дубай",
        "Сингапур",
        "Торонто",
        "Шахтар",
        "Абу Даби",
        "Чита",
        "Венеция",
        "Мюнхен",
        "Прага",
        "Будапешт",
        "Цюрих",
        "Лион",
        "Порту",
        "Таллин",
        "Рига",
        "Баку",
        "Алматы",
        "Ташкент",
        "Сеул",
        "Киото",
        "Мельбурн",
        "Чикаго",
        "Лос-Анджелес",
        "Мехико",
        "Буэнос-Айрес",
        "Рейкьявик"
    ]
    
    // MARK: – Subviews
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let showMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать сообщение", for: .normal)
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
    
    private let blurView: UIVisualEffectView = {
        let blurView = UIVisualEffectView()
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    private let thanksLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.textColor = .black
        label.text = "Спасибо!"
        label.alpha = 0
        return label
    }()
    
    private let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.text = "Город: "
        return label
    }()
    
    private let loadImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Загрузить изображение", for: .normal)
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
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        return imageView
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
        view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        showMessageButton.addTarget(self, action: #selector(showMessageButtonTapped), for: .touchUpInside)
        loadImageButton.addTarget(self, action: #selector(loadImageButtonTapped), for: .touchUpInside)
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        view.addSubview(backButton)
        view.addSubview(showMessageButton)
        view.addSubview(pickerView)
        view.addSubview(capitalLabel)
        view.addSubview(imageView)
        view.addSubview(loadImageButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            
            showMessageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            showMessageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showMessageButton.widthAnchor.constraint(equalToConstant: 260),
            
            pickerView.topAnchor.constraint(equalTo: showMessageButton.bottomAnchor, constant: 30),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pickerView.heightAnchor.constraint(equalToConstant: 200),
            
            capitalLabel.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 10),
            capitalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.bottomAnchor.constraint(equalTo: loadImageButton.topAnchor, constant: -20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            loadImageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            loadImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadImageButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    private func setupThanksMessage() {
        blurView.alpha = 1
        blurView.effect = nil
        thanksLabel.alpha = 0
        
        view.addSubview(blurView)
        blurView.contentView.addSubview(thanksLabel)
        
        NSLayoutConstraint.activate([
            self.blurView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.blurView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.blurView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.blurView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.thanksLabel.centerXAnchor.constraint(equalTo: self.blurView.centerXAnchor),
            self.thanksLabel.centerYAnchor.constraint(equalTo: self.blurView.centerYAnchor),
        ])
        
        // Появляется блюр, потом текст
        UIView.animate(withDuration: 0.5) {
            self.blurView.effect = UIBlurEffect(style: .systemChromeMaterialLight)
        }
        completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.thanksLabel.alpha = 1
            }
        }
        
        // Текст прыгает
        UIView.animate(withDuration: 0.5, delay: 0.7) {
            self.thanksLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.thanksLabel.transform = .identity
            }
        }
        
        // Всё убирается
        UIView.animate(withDuration: 0.5, delay: 1.6) {
            print(self.thanksLabel.alpha)
            self.blurView.alpha = 0
            self.thanksLabel.alpha = 0
        } completion: { _ in
            self.blurView.removeFromSuperview()
            self.thanksLabel.removeFromSuperview()
        }
    }
    
    private func openImagePicker(source: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = source
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        present(alert, animated: true)
    }
    
    private func checkGalleryStatus() {
        let photoStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoStatus {
        case .authorized, .limited:
            self.openImagePicker(source: .photoLibrary)
        case .denied:
            showAlert(title: "Запрещено", message: "Доступ к галерее запрещён. Включите доступ в настройках")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    if status == .authorized || status == .limited {
                        self.openImagePicker(source: .photoLibrary)
                    } else {
                        self.showAlert(title: "Доступ запрещен", message: "Вы отклонили запрос")
                    }
                }
            }
            print("notDetermined")
        case .restricted:
            showAlert(title: "Ограничено", message: "Дотсуп ограничен системой")
        default: break
        }
    }
    
    private func checkCameraStatus() {
        let cameraStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch cameraStatus {
        case .authorized:
            self.openImagePicker(source: .camera)
        case .denied:
            showAlert(title: "Запрещено", message: "Доступ к камере запрещён. Включите доступ в настройках")
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        self.openImagePicker(source: .camera)
                    } else {
                        self.showAlert(title: "Доступ запрещен", message: "Вы отклонили запрос")
                    }
                }
            }
        case .restricted:
            showAlert(title: "Ограничено", message: "Дотсуп ограничен системой")
        default: break
        }
    }
    
    // MARK: – Actions
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func showMessageButtonTapped() {
        let alert = UIAlertController(title: "Важное сообщение", message: "Спасибо, что выбрали наше приложение", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.setupThanksMessage()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @objc private func loadImageButtonTapped() {
        let alert = UIAlertController(title: "Выберите источник", message: "Откуда взять фото?", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Камера", style: .default) { [weak self] _ in
            self?.checkCameraStatus()
        }
        
        let galleryAction = UIAlertAction(title: "Галерея", style: .default) { [weak self] _ in
            self?.checkGalleryStatus()
        }
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        
        present(alert, animated: true)
    }
}

// MARK: – UIPickerViewDataSource
extension MainViewControllerL22: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cities.count
    }
}

// MARK: – UIPickerViewDelegate
extension MainViewControllerL22: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        40
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        capitalLabel.text = "Город: \(cities[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return PickerViewRow(city: cities[row])
    }
}

// MARK: – UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension MainViewControllerL22: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        imageView.image = image
        
        dismiss(animated: true)
    }
}
