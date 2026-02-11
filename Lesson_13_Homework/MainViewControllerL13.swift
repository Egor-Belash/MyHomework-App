//
//  MainViewControllerL13.swift
//  My Homework App
//
//  Created by Egor on 10.02.26.
//

import UIKit

class MainViewControllerL13: UIViewController {
    
    // MARK: – Properties
    private var continents = [
        ContinentModel(
            continentName: "Евразия",
            countries: [
                CellModel(countryName: "Беларусь", countryCapital: "Минск", flag: "🇧🇾"),
                CellModel(countryName: "Россия", countryCapital: "Москва", flag: "🇷🇺"),
                CellModel(countryName: "Украина", countryCapital: "Киев", flag: "🇺🇦"),
                CellModel(countryName: "Польша", countryCapital: "Варшава", flag: "🇵🇱"),
                CellModel(countryName: "Италия", countryCapital: "Рим", flag: "🇮🇹"),
                CellModel(countryName: "Германия", countryCapital: "Берлин", flag: "🇩🇪"),
                CellModel(countryName: "Казакстан", countryCapital: "Астана", flag: "🇰🇿"),
                CellModel(countryName: "Китай", countryCapital: "Пекин", flag: "🇨🇳"),
                CellModel(countryName: "Япония", countryCapital: "Токио", flag: "🇯🇵"),
                CellModel(countryName: "Узбекистан", countryCapital: "Ташкент", flag: "🇺🇿"),
                CellModel(countryName: "Туркменистан", countryCapital: "Ашхабад", flag: "🇹🇲"),
            ]
        ),
        ContinentModel(
            continentName: "Африка",
            countries: [
                CellModel(countryName: "Египет", countryCapital: "Каир", flag: "🇪🇬"),
                CellModel(countryName: "Тунис", countryCapital: "Тунис", flag: "🇹🇳"),
                CellModel(countryName: "Алжир", countryCapital: "Алжир", flag: "🇩🇿"),
                CellModel(countryName: "Судан", countryCapital: "Хартум", flag: "🇸🇩"),
                CellModel(countryName: "Ботсвана", countryCapital: "Габороне", flag: "🇧🇼"),
            ]
        ),
        ContinentModel(
            continentName: "Северная Америка",
            countries: [
                CellModel(countryName: "США", countryCapital: "Вашингтон", flag: "🇺🇸"),
                CellModel(countryName: "Канада", countryCapital: "Оттава", flag: "🇨🇦"),
                CellModel(countryName: "Мексика", countryCapital: "Мехико", flag: "🇲🇽"),
                CellModel(countryName: "Куба", countryCapital: "Гавана", flag: "🇨🇺"),
                CellModel(countryName: "Гватемала", countryCapital: "Гватемала", flag: "🇬🇹"),
            ]
        ),
        ContinentModel(
            continentName: "Южная Америка",
            countries: [
                CellModel(countryName: "Аргентина", countryCapital: "Буэнос-Айрес", flag: "🇦🇷"),
                CellModel(countryName: "Бразилия", countryCapital: "Бразилиа", flag: "🇧🇷"),
                CellModel(countryName: "Венесуэла", countryCapital: "Каракас", flag: "🇻🇪"),
                CellModel(countryName: "Колумбия", countryCapital: "Богота", flag: "🇨🇴"),
                CellModel(countryName: "Перу", countryCapital: "Лима", flag: "🇵🇪"),
            ]
        ),
        ContinentModel(
            continentName: "Австралия",
            countries: [
                CellModel(countryName: "Австралия", countryCapital: "Канберра", flag: "🇦🇺"),
            ]
        ),
        ContinentModel(
            continentName: "Антарктида",
            countries: [
                CellModel(countryName: "Антарктида", countryCapital: "–", flag: "🇦🇶"),
            ]
        ),
        
    ]
    
    // MARK: – Subviews
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Континенты"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let myTableView = UITableView()
    
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
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.reuseIdentifier)
        
        view.addSubview(label)
        view.addSubview(backButton)
        view.addSubview(myTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 80),

            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 5),
        
            myTableView.topAnchor.constraint(equalTo: label.bottomAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func makeHeader(with section: Int) -> UIView {
        let headerView = UIView()
        
        headerView.backgroundColor = .systemGray6
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.text = continents[section].continentName
        
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
        
        return headerView
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
}

extension MainViewControllerL13: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { // шапка
//        return continents[section].continentName
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return continents.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents[section].countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.reuseIdentifier, for: indexPath) as? CountryCell else { return UITableViewCell()}
        cell.configure(with: continents[indexPath.section].countries[indexPath.row])
        return cell
    }
    
    
}

extension MainViewControllerL13: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {         // Этот метод отвечает за нажатие на ячейку
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {      // header
        return makeHeader(with: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {    // header height
        return 30
    }
    
}
