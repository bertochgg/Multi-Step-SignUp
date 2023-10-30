//
//  BaseSignUpViewController.swift
//  OnboardingCreation
//
//  Created by Cesar Humberto Grifaldo Garcia on 18/10/23.
//

import UIKit

protocol BaseSignUpViewControllerDelegate: AnyObject {
    func didReceiveData(model: Model)
}

class BaseSignUpViewController: UIViewController {
    weak var delegate: BaseSignUpViewControllerDelegate?
    
    var getDataTextFieldText: String {
        return dataTextField.text ?? ""
    }
    
    lazy private var views = [titleLabel, descriptionLabel, dataTextField, termsLabel, continueButton]
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var dataTextField: UITextField = {
        let textField = UITextField()
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
        label.textColor = .lightGray
        label.text = "By loging in or signing up you agree to Foodlam’s Terms and Condition & Privacy Policies"
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
        button.addTarget(self, action: #selector(continueNextView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        dataTextField.delegate = self
        setupCommonUI()
    }
    
    func configure(titleText: String, descriptionText: String, placeholderText: String) {
        self.titleLabel.text = titleText
        self.descriptionLabel.text = descriptionText
        self.dataTextField.placeholder = placeholderText
    }
    
    private func setupCommonUI() {
        views.forEach { view in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            dataTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            dataTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            dataTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            dataTextField.heightAnchor.constraint(equalToConstant: 41),
            
            termsLabel.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -28),
            termsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            termsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -45),
            continueButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
}

extension BaseSignUpViewController {
    @objc
    func continueNextView() {
        
    }
}

extension BaseSignUpViewController: UITextFieldDelegate {
    // Method to dismiss keyboard with return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dataTextField.resignFirstResponder()
        return true
    }
}
