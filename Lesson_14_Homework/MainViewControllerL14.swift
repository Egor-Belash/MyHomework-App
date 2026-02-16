//
//  MainViewControllerL14.swift
//  My Homework App
//
//  Created by Egor on 15.02.26.
//

import UIKit

class MainViewControllerL14: UIViewController {
    
    // MARK: – Properties
    private var photos: [CellModelL14] = []
    private var likedPhotos: [CellModelL14] = []
    private var itemsCounter: Int = 18

    
    
    // MARK: – Subviews
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Галерея"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        return label
    }()
    
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
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = .init(width: 0, height: 2)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let likedButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Liked", for: .normal)
        button.tintColor = .systemPink
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = .init(width: 0, height: 2)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    // MARK: – Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        
        elementsOfCollectionView()
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CellL14.self, forCellWithReuseIdentifier: CellL14.identifier)
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        likedButton.addTarget(self, action: #selector(likedButtonTapped), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(backButton)
        view.addSubview(addButton)
        view.addSubview(likedButton)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            
            addButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 35),
            
            likedButton.heightAnchor.constraint(equalToConstant: 35),
            likedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            likedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            likedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
        
        ])
    }
    
    private func elementsOfCollectionView() {
        for i in 1...18 {
            photos.append(CellModelL14(title: "Фото \(i)", imageName: "person", dateOfCreation: "15.02.2026", isLiked: false, isInFavorite: false))
        }
    }
    
    @objc private func addButtonTapped() {
        itemsCounter += 1
        photos.append(CellModelL14(title: "Фото \(itemsCounter)", imageName: "person", dateOfCreation: "15.02.2026", isLiked: true, isInFavorite: false))
        collectionView.reloadData()
        
        // чтобы скролилось при добавлении новых
        let newIndexPath = IndexPath(row: photos.count - 1, section: 0)
        collectionView.scrollToItem(at: newIndexPath, at: .bottom, animated: true)
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func likedButtonTapped() {
        let likedPhotos = photos.filter { $0.isLiked }
        
        let vc = LikeVC(likedPhotos: likedPhotos)
        navigationController?.pushViewController(vc, animated: true)
    
    }
}

// Настройка ячеек UICollectionView
extension MainViewControllerL14: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellL14.identifier, for: indexPath) as? CellL14 else {
            return UICollectionViewCell()
        }

        cell.configure(with: photos[indexPath.item])
        
        return cell
    }
}

// Настройка расположения UICollectionView
extension MainViewControllerL14: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    // Динамический размер
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 150, height: 150)
        let isPad = UIDevice.current.userInterfaceIdiom == .pad
        let colomns: CGFloat = isPad ? 5 : 3
        let padding: CGFloat = 10
        let spacing: CGFloat = 10
        
        let totalPadding = padding * 2
        let totalSpacing = (colomns - 1) * spacing
        
        let availableWidth = collectionView.frame.width - totalPadding - totalSpacing
        let width = floor(availableWidth / colomns)
        let height = width * (isPad ? 1.2 : 1.0)

        return CGSize(width: width, height: height)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
}

extension MainViewControllerL14: UICollectionViewDelegate {
    
}

