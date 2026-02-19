//
//  Cell.swift
//  My Homework App
//
//  Created by Egor on 15.02.26.
//

import UIKit

class CellL14: UICollectionViewCell {
    
    // MARK: – Properties
    static var identifier: String = "CellL14"
    
    private var isLiked: Bool = false
    private var isInFavorite: Bool = false

    
    // MARK: – Subviews
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        imageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private let imageNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let imageDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
//        let config = UIButton.Configuration.plain()
//        button.configuration = config
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let heartView = Heart()
    
    private let likeIndicator: UIView = {
        let likeIndicator = UIView()
        likeIndicator.translatesAutoresizingMaskIntoConstraints = false
        likeIndicator.backgroundColor = .clear
        return likeIndicator
    }()
    
    // MARK: – Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        imageNameLabel.text = nil
        imageDateLabel.text = nil
        likeIndicator.isHidden = true
        likeButton.isSelected = false
        favoriteButton.isSelected = false
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        contentView.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(favoriteButton)
        
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        likeIndicator.addSubview(heartView)
        contentView.addSubview(likeIndicator)
        
        contentView.addSubview(imageView)
        contentView.addSubview(imageNameLabel)
        contentView.addSubview(imageDateLabel)
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            imageView.topAnchor.constraint(equalTo: imageNameLabel.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.55),
            
            likeIndicator.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 12),
            likeIndicator.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 12),
            likeIndicator.heightAnchor.constraint(equalToConstant: 10),
            likeIndicator.widthAnchor.constraint(equalToConstant: 10),
            
            imageDateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            imageDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            stackView.topAnchor.constraint(equalTo: imageDateLabel.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
        ])
    }
    
    func configure(with model: CellModelL14) {
        imageView.image = UIImage(systemName: model.imageName)
        imageNameLabel.text = model.title
        imageDateLabel.text = model.dateOfCreation
        likeIndicator.isHidden = !model.isLiked
        isLiked.self = model.isLiked
        isInFavorite.self = model.isInFavorite
    }
    
    @objc private func likeButtonTapped(sender: UIButton) {
        isLiked.toggle()
        
        if isLiked {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            sender.tintColor = .systemRed
        } else {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            sender.tintColor = .label
        }

    }
    
    @objc private func favoriteButtonTapped(sender: UIButton) {
        isInFavorite.toggle()
        if isInFavorite {
            sender.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            sender.tintColor = .systemBlue
        } else {
            sender.setImage(UIImage(systemName: "bookmark"), for: .normal)
            sender.tintColor = .label
        }
    }
    
}

