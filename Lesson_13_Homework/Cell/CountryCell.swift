//
//  CountryCell.swift
//  My Homework App
//
//  Created by Egor on 11.02.26.
//

import UIKit

class CountryCell: UITableViewCell {
    
    // MARK: – Properties
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    let flagView = FlagView()
    
    // MARK: – Subviews
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        return label
    }()
    
    // MARK: – Lifecycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
        countryLabel.text = nil
        capitalLabel.text = nil
        flagView.flagEmoji = nil
        
        }

    
    // MARK: – Layout
    private func setupViewProperties() {
        
    }
    
    private func setupSubviews() {
        contentView.addSubview(countryLabel)
        contentView.addSubview(capitalLabel)

        flagView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(flagView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            flagView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            flagView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagView.widthAnchor.constraint(equalToConstant: 50),
            flagView.heightAnchor.constraint(equalToConstant: 50),
            
            countryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            countryLabel.trailingAnchor.constraint(equalTo: flagView.leadingAnchor),
            
            capitalLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 6),
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            capitalLabel.trailingAnchor.constraint(equalTo: flagView.leadingAnchor),
            capitalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
    
    func configure(with model: CellModel) {
        countryLabel.text = model.countryName
        capitalLabel.text = model.countryCapital
        flagView.flagEmoji = model.flag
    }
    
}
