//
//  MainViewControllerL21.swift
//  My Homework App
//
//  Created by Egor on 8.03.26.
//

import UIKit

final class MainViewControllerL21: UIViewController {
    
    // MARK: – Properties
    private var textSize: CGFloat = 20

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
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Текст — это связная последовательность символов или предложений, объединенных общей темой и грамматически связанных друг с другом. Он представляет собой зафиксированную мысль, существующую в устной или письменной форме. Основные типы текста включают повествование, описание и рассуждение. В широком смысле текст — это ткань, сплетение или структура."
        label.textAlignment = .justified
        return label
    }()
    
    private let segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Обычный", "Жирный", "Курсив", "U̲", "RGB"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    
    private let stepperControl: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.stepValue = 2
        stepper.value = 20
        stepper.minimumValue = 10
        stepper.maximumValue = 28
        return stepper
    }()
    
    private let fontSizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Размер шрифта: 20"
        return label
    }()
    
    private let cancelChangesButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Отменить изменения", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.shadowColor = UIColor.label.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 8
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
        segmentControl.addTarget(self, action: #selector(segmentChange), for: .valueChanged)
        stepperControl.addTarget(self, action: #selector(stepperChange), for: .valueChanged)
        
        cancelChangesButton.addTarget(self, action: #selector(cancelChangesButtonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        view.addSubview(label)
        view.addSubview(segmentControl)
        view.addSubview(stepperControl)
        view.addSubview(fontSizeLabel)
        view.addSubview(cancelChangesButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            segmentControl.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -220),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentControl.heightAnchor.constraint(equalToConstant: 30),
            
            stepperControl.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20),
            stepperControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fontSizeLabel.topAnchor.constraint(equalTo: stepperControl.bottomAnchor, constant: 10),
            fontSizeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cancelChangesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            cancelChangesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelChangesButton.widthAnchor.constraint(equalToConstant: 240),
        ])
    }
    
    private func applyAttribute(_ attribute: NSAttributedString.Key, value: Any) {
        guard let text = label.text else { return }
        let attributed = NSMutableAttributedString(string: text)
        
        attributed.addAttribute(attribute, value: value, range: NSRange(location: 0, length: text.count))
        
        label.attributedText = attributed
    }
    
    private func makeTextRegular() {
        applyAttribute(.font, value: UIFont.systemFont(ofSize: textSize))
    }
    
    private func makeTextBold() {
        applyAttribute(.font, value: UIFont.boldSystemFont(ofSize: textSize))
    }
    
    private func makeTextItalics() {
        applyAttribute(.font, value: UIFont.italicSystemFont(ofSize: textSize))
    }
    
    private func makeTextUnderLine() {
        guard let text = label.text else { return }
        let attributed = NSMutableAttributedString(string: text)
        
        attributed.addAttribute(.font, value: UIFont.systemFont(ofSize: textSize), range: NSRange(location: 0, length: text.count))
        attributed.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))

        label.attributedText = attributed
    }
    
    private func makeTextColourfull() {
        guard let text = label.text else { return }
        let attributed = NSMutableAttributedString(string: text)
        
        let colours: [UIColor] = [.red, .orange, .yellow, .green, .systemBlue, .blue, .purple]
        
        for i in 0..<text.count {
            let colour = colours[i % colours.count]
            attributed.addAttribute(.foregroundColor, value: colour, range: NSRange(location: i, length: 1))
        }
        
        attributed.addAttribute(.font, value: UIFont.systemFont(ofSize: textSize), range: NSRange(location: 0, length: text.count))
        
        label.attributedText = attributed
    }
    
    // MARK: – Actions
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func segmentChange(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            makeTextRegular()
        case 1:
            makeTextBold()
        case 2:
            makeTextItalics()
        case 3:
            makeTextUnderLine()
        case 4:
            makeTextColourfull()
        default:
            makeTextRegular()
        }
    }
    
    @objc private func stepperChange(_ stepper: UIStepper) {
        textSize = stepper.value
        fontSizeLabel.text = "Размер шрифта: \(Int(textSize))"
        
        segmentChange(segmentControl)
    }
    
    @objc private func cancelChangesButtonTapped() {
        guard let text = label.text else { return }
        let attributed = NSMutableAttributedString(string: text)
        
        attributed.removeAttribute(.font, range: NSRange(location: 0, length: text.count))
        attributed.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: NSRange(location: 0, length: text.count))
        segmentControl.selectedSegmentIndex = 0
        stepperControl.value = 20
        fontSizeLabel.text = "Размер шрифта: 20"
        textSize = 20
        
        label.attributedText = attributed
    }
    
}
