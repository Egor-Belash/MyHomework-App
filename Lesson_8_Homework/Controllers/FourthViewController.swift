//
//  FourthViewController.swift
//  Lesson_8_Homework
//
//  Created by Egor on 26.01.26.
//

import UIKit


class FourthViewController: UIViewController {
    
    private let imageView = UIImageView()
    
    private let mainStackView = UIStackView()
    
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let ratingStackView = UIStackView()
    private let starImageView = UIImageView()
    private let ratingLabel = UILabel()
    
    private let addToCartStackView = UIStackView()
    private let removeFromCartButton = UIButton(type: .system)
    private let addToCartButton = UIButton(type: .system)
    private let countLabel = UILabel()
    
    private let priceLabel = UILabel()
    private var count: Int = 1
    private let price: Double = 299.99
    private var sum: Double = 299.99
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    func setupViewProperties() {
        view.backgroundColor = .systemBackground
        imageView.image = UIImage(named: "image4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .top
        view.addSubview(imageView)
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupSubviews() {
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.alignment = .leading
        mainStackView.distribution = .fill
        mainStackView.layer.backgroundColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        mainStackView.layer.cornerRadius = 10
        mainStackView.layer.borderWidth = 3
        mainStackView.layer.borderColor = UIColor.darkGray.cgColor
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.layer.shadowOpacity = 0.15
        mainStackView.layer.shadowOffset = CGSize(width: 0, height: 10)
        mainStackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        view.addSubview(mainStackView)
        
        nameLabel.text = "Рабочий инструмент"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .black
        
        descriptionLabel.text =
        """
        Отличный инструмент для всей семьи.
        Возможность делать любые работы: ремонт,
        строительство, уборка, сбор урожая и др.
        Требования: электричество, вода
        """
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.textColor = .black
        
        ratingStackView.axis = .horizontal
        ratingStackView.spacing = 5
        ratingStackView.alignment = .center
        ratingStackView.distribution = .fill
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
                
        for _ in 1...5 {
            let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
            starImageView.tintColor = .systemYellow
            starImageView.contentMode = .scaleAspectFit
            starImageView.translatesAutoresizingMaskIntoConstraints = false
            starImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            starImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            ratingStackView.addArrangedSubview(starImageView)
        }
        
        ratingLabel.text = "(4.8)"
        ratingLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.addArrangedSubview(ratingLabel)
        
        
        addToCartStackView.axis = .horizontal
        addToCartStackView.spacing = 10
        addToCartStackView.distribution = .fill
        addToCartStackView.translatesAutoresizingMaskIntoConstraints = false
        
        removeFromCartButton.setTitle("-", for: .normal)
        removeFromCartButton.setTitleColor(.black, for: .normal)
        removeFromCartButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        removeFromCartButton.translatesAutoresizingMaskIntoConstraints = false
        removeFromCartButton.addTarget(self, action: #selector(removeFromCart), for: .touchUpInside)
        
        countLabel.text = "\(count)"
        countLabel.textColor = .black
        countLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        addToCartButton.setTitle("+", for: .normal)
        addToCartButton.setTitleColor(.black, for: .normal)
        addToCartButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        
        
        addToCartStackView.addArrangedSubview(removeFromCartButton)
        addToCartStackView.addArrangedSubview(countLabel)
        addToCartStackView.addArrangedSubview(addToCartButton)
        
        priceLabel.text = "Цена: $299.99"
        priceLabel.textColor = .black
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        mainStackView.addArrangedSubview(nameLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(ratingStackView)
        mainStackView.addArrangedSubview(addToCartStackView)
        mainStackView.addArrangedSubview(priceLabel)

        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            mainStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ])
    }
    
    // MARK: – Actions
    
    @objc private func removeFromCart() {
        if count > 1 {
            count -= 1
            countLabel.text = "\(count)"
            
            sum -= price
            priceLabel.text = String(format: "Цена: $%.2f", sum)
        }
    }
    
    @objc private func addToCart() {
        count += 1
        countLabel.text = "\(count)"
        
        sum += price
        priceLabel.text = String(format: "Цена: $%.2f", sum)
    }
}

