//
//  CityTableCell.swift
//  My Homework App
//
//  Created by Egor on 19.03.26.
//

import UIKit

final class CityTableCell: UITableViewCell {
    
    // MARK: – Properties
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    private var timeZoneNumber: String = ""
    
    // MARK: – Subviews
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    private var timeZoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 100, weight: .thin)
        label.textAlignment = .right
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.textColor = .label
        return label
    }()
    
    // MARK: – INIT
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
        cityNameLabel.text = nil
        timeZoneLabel.text = ""
        timeLabel.text = ""
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        contentView.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        contentView.addSubview(cityNameLabel)
        contentView.addSubview(timeZoneLabel)
        contentView.addSubview(timeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cityNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -15),
            
            timeZoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeZoneLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 15),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
        ])
    }
    
    func configure(with model: CityModel) {
        cityNameLabel.text = model.cityName
        timeZoneLabel.text = model.timeZone
        timeZoneNumber = model.timeZone
        
        operateTimeZone(timeZoneNumber)
    }
    
    func operateTimeZone(_ timeZoneNumber: String) {
        
        guard let timeZoneNumber = Int(timeZoneNumber.filter { $0.isNumber }) else { return }
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        if let timeZone = TimeZone(secondsFromGMT: timeZoneNumber * 3600) {
            formatter.timeZone = timeZone
        }
        
        let time = formatter.string(from: now)
        
        timeLabel.text = time
    }
    
}

