//
//  ViewController.swift
//  Lesson_8_Homework
//
//  Created by Egor on 22.01.26.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView = UIImageView()
    
    let label1 = UILabel()
    let username = UILabel()
    let password = UILabel()
    
    let inputUsername = UITextField()
    let inputPassword = UITextField()
    
    let buttonLogin = UIButton(type: .system)
    let buttonRegister = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    func setupViewProperties() {
        imageView.image = UIImage(named: "33oajbebzxfjbz20zla5fwwq2bgr2g0r.jpeg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
    }
            
    func setupSubviews() {
        label1.text = "My Home Control"
        label1.textColor = .white
        label1.font = UIFont.boldSystemFont(ofSize: 30)
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)
        
        inputUsername.placeholder = "Please enter username"
        inputUsername.borderStyle = .roundedRect
        inputUsername.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputUsername)
        
        inputPassword.placeholder = "Please enter password"
        inputPassword.borderStyle = .roundedRect
        inputPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputPassword)
        
        username.text = "Username"
        username.textColor = .white
        username.font = UIFont.systemFont(ofSize: 17)
        username.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(username)
        
        password.text = "Password"
        password.textColor = .white
        password.font = UIFont.systemFont(ofSize: 17)
        password.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(password)
        
        buttonLogin.setTitle("Log in", for: .normal)
        buttonLogin.setTitleColor( .black, for: .normal)
        buttonLogin.backgroundColor = .white
        buttonLogin.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonLogin)
        
        buttonLogin.addTarget(self, action: #selector(pushTapped), for: .touchUpInside)
            
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.setTitleColor( .white, for: .normal)
        buttonRegister.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonRegister)
            
        buttonRegister.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
    }
                

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            inputUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputUsername.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 150),
            inputUsername.widthAnchor.constraint(equalToConstant: 200),
            
            inputPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputPassword.topAnchor.constraint(equalTo: inputUsername.bottomAnchor, constant: 70),
            inputPassword.widthAnchor.constraint(equalToConstant: 200),
            
            username.bottomAnchor.constraint(equalTo: inputUsername.topAnchor, constant: -5),
            username.leadingAnchor.constraint(equalTo: inputUsername.leadingAnchor),
            
            password.bottomAnchor.constraint(equalTo: inputPassword.topAnchor, constant: -5),
            password.leadingAnchor.constraint(equalTo: inputPassword.leadingAnchor),
            
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.topAnchor.constraint(equalTo: inputPassword.bottomAnchor, constant: 50),
            buttonLogin.widthAnchor.constraint(equalToConstant: 150),
            
            buttonRegister.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRegister.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            
        ])

    }
    
    // MARK: – Actions
    
    @objc private func pushTapped() {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func presentButtonTapped() {
        let vc = ThirdViewController()
        present(vc, animated: true)
    }
    
}

