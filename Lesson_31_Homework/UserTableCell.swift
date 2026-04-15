//
//  UserTableCell.swift
//  My Homework App
//
//  Created by Egor on 13.04.2026.
//

import UIKit

final class UserTableCell: UITableViewCell {
    
    // MARK: – Properties
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: – Subviews
    private let userId: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .regular)
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
        userId.text = nil
        userName.text = nil
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        addSubview(userId)
        addSubview(userName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userId.centerYAnchor.constraint(equalTo: centerYAnchor),
            userId.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            userName.centerYAnchor.constraint(equalTo: centerYAnchor),
            userName.leadingAnchor.constraint(equalTo: userId.trailingAnchor, constant: 10),
        ])
    }
    
    func configure(with model: UserModel) {
        userId.text = "\(model.id)."
        userName.text = model.username
    }
    
}
