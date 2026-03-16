//
//  PickerViewRow.swift
//  My Homework App
//
//  Created by Egor on 15.03.26.
//

import UIKit

final class PickerViewRow: UIView {
    
    // MARK: – Properties
    private let city: String
    
    // MARK: – Subviews
    private let image: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "building.2.crop.circle.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    // MARK: – INIT
    init(city: String) {
        self.city = city
        super.init(frame: .zero)
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        backgroundColor = .clear
    }
    
    private func setupSubviews() {
        label.text = city
        
        addSubview(image)
        addSubview(label)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 20),
            image.widthAnchor.constraint(equalToConstant: 20),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
}
