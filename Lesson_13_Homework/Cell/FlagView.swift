//
//  FlagView.swift
//  My Homework App
//
//  Created by Egor on 11.02.26.
//

import UIKit

class FlagView: UIView {
    
    // MARK: – Properties
    var flagEmoji: String? {
        didSet {
            flagLabel.text = flagEmoji
        }
    }
    
    // MARK: – Subviews
    private let flagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    // MARK: – Lifecycles
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
    }
    
    private func setupSubviews() {
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.3
        
        addSubview(flagLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            flagLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            flagLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
}
