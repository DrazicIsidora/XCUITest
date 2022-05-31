//
//  LoginView.swift
//  Code9-Mobile-2022-iOS
//
//  Created by Zolt Varga on 4/24/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    // MARK: - UI Properties
    
    lazy var logo: UIImageView = {
        let image = UIImage(named:"C9-blue")
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "logoIdentifier"
        return view
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "userNameLabelIdentifier"
        return label
    }()
    
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "passwordLabelIdentifier"
        return label
    }()
    
    lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 3
        textField.placeholder = "Type your Username."
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(16)
        textField.accessibilityIdentifier = "userNameTextFieldIdentifier"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 3
        textField.placeholder = "Type your Password."
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(16)
        textField.isSecureTextEntry = true
        textField.accessibilityIdentifier = "passwordTextFieldIdentifier"
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.accessibilityIdentifier = "loginButtonIdentifier"
        return button
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        scrollView.addSubview(logo)
        logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        logo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        scrollView.addSubview(passwordLabel)
        passwordLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        scrollView.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        scrollView.addSubview(userNameTextField)
        userNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        userNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        userNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userNameTextField.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -20).isActive = true
        
        scrollView.addSubview(userNameLabel)
        userNameLabel.bottomAnchor.constraint(equalTo: userNameTextField.topAnchor, constant: -20).isActive = true
        userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // This is just for debug purpuse to easier see the elements postion, uncomment it
        // addDebugColours()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Debug
private extension LoginView {
    private func addDebugColours() {
        logo.backgroundColor = .red
        logo.layer.borderColor = UIColor.red.cgColor
        logo.layer.borderWidth = 4
        
        passwordLabel.backgroundColor = .brown
        passwordTextField.backgroundColor = .yellow
        loginButton.backgroundColor = .magenta
        userNameTextField.backgroundColor = .systemTeal
        userNameLabel.backgroundColor = .orange
    }
}
