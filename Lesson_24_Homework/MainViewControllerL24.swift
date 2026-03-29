//
//  MainViewControllerL24.swift
//  My Homework App
//
//  Created by Egor on 18.03.26.
//

import UIKit

final class MainViewControllerL24: UIViewController {
    
    // MARK: – Properties
    private var cities = [
        CityModel(cityName: "Гонолулу", timeZone: "UTC -10"),
        CityModel(cityName: "Лос-Анджелес", timeZone: "UTC -8"),
        CityModel(cityName: "Нью-Йорк", timeZone: "UTC -5"),
        CityModel(cityName: "Рио-де-Жанейро", timeZone: "UTC -3"),
        CityModel(cityName: "Лондон", timeZone: "UTC +0"),
        CityModel(cityName: "Берлин", timeZone: "UTC +1"),
        CityModel(cityName: "Минск", timeZone: "UTC +3"),
        CityModel(cityName: "Москва", timeZone: "UTC +3"),
        CityModel(cityName: "Дубай", timeZone: "UTC +4"),
        CityModel(cityName: "Астана", timeZone: "UTC +5"),
        CityModel(cityName: "Бангкок", timeZone: "UTC +7"),
        CityModel(cityName: "Пекин", timeZone: "UTC +8"),
        CityModel(cityName: "Токио", timeZone: "UTC +9"),
        CityModel(cityName: "Владивосток", timeZone: "UTC +10"),
    ]
    
    private var timer: Timer?

    // MARK: – Subviews
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.alpha = 0
        return blurView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Местное время"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
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
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let addingView: AddingView = {
        let view = AddingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: – Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        
        startTimer()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    // MARK: – Layout
    private func setupViewProperties() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CityTableCell.self, forCellReuseIdentifier: CityTableCell.reuseIdentifier)
        
        addingView.delegate = self
        
        view.addSubview(addButton)
        view.addSubview(label)
        view.addSubview(backButton)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addButton.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: – Actions
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            
            for cell in self.tableView.visibleCells {
                if let cityCell = cell as? CityTableCell {
                    cityCell.updateTime()
                }
            }
        }
        guard let timer else { return }
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc private func addButtonTapped() {
        view.addSubview(blurView)
        view.addSubview(addingView)
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addingView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            addingView.heightAnchor.constraint(equalToConstant: 500),
        ])
        
        UIView.animate(withDuration: 0.2) {
            self.blurView.alpha = 0.5
        }
        
        UIView.animate(withDuration: 0.2) {
            self.addingView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.addingView.transform = .identity
            }
        }
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    private func removeItem(at indexPath: IndexPath) {
        cities.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

// MARK: – UITableViewDataSource
extension MainViewControllerL24: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableCell.reuseIdentifier, for: indexPath) as? CityTableCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: cities[indexPath.row])
        
        return cell
    }
}

// MARK: – UITableViewDelegate
extension MainViewControllerL24: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeItem(at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, completion in
            self?.removeItem(at: indexPath)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

// MARK: – AddingViewDelegate
extension MainViewControllerL24: AddingViewDelegate {
    func didAddCity(name:  String, timeZone: String) {
        cities.append(CityModel(cityName: name, timeZone: timeZone))
        tableView.reloadData()
        
        let newIndexPath = IndexPath(row: cities.count - 1, section: 0)
        tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        
        addingView.removeFromSuperview()
        blurView.alpha = 0
        blurView.removeFromSuperview()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
