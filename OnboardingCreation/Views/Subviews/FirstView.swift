//
//  FirstView.swift
//  OnboardingCreation
//
//  Created by Cesar Humberto Grifaldo Garcia on 17/10/23.
//

import UIKit

protocol FirstViewDelegate: AnyObject {
    func didReceiveData(model: Model)
}

final class FirstView: UIView {
    weak var delegate: FirstViewDelegate?
    
    lazy private var views: [UIView] = [
        titleLabel,
        descriptionLabel,
        nameTextField,
        termsLabel,
        continueButton
    ]
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What's your name?"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your name to continue to create to your account"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.textColor = .gray
        textField.backgroundColor = UIColor(red: 0.098, green: 0.106, blue: 0.11, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 8
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy private var termsLabel: UILabel = {
        let label = UILabel()
        label.text = "By loging in or signing up you agree to Foodlam’s Terms and Condition & Privacy Policies"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0.153, green: 0.169, blue: 0.173, alpha: 1)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(pushSecondView), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        nameTextField.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        views.forEach { view in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 41),
            
            termsLabel.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -28),
            termsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            termsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
            continueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
}

extension FirstView: UITextFieldDelegate {
    // Method to dismiss keyboard with return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}

private extension FirstView {
    @objc
    func pushSecondView() {
        let model = Model(firstName: nameTextField.text,
                          email: nil,
                          password: nil)
        delegate?.didReceiveData(model: model)
    }
}

