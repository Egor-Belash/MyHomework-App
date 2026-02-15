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
    
    
    // MARK: – Subviews
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
        
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            
        ])
    }
    
    private func elementsOfCollectionView() {
        for i in 1...50 {
            photos.append(CellModelL14(title: "Фото \(i)", imageName: "person", dateOfCreation: "15.02.2026", isLiked: false, isInfavorite: false))
        }
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

