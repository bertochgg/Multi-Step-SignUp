//
//  FirstViewController.swift
//  OnboardingCreation
//
//  Created by Cesar Humberto Grifaldo Garcia on 17/10/23.
//

import UIKit

final class FirstViewController: BaseSignUpViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.delegate = self
        setupFirstView()
    }
    
    override func continueNextView() {
        let model = Model(firstName: getDataTextFieldText,
                          email: nil,
                          password: nil)
        delegate?.didReceiveData(model: model)
    }
    
    private func setupFirstView() {
        self.configure(titleText: "What's your name",
                       descriptionText: "Enter your name to continue to create to your account",
                       placeholderText: "Enter your name")
    }
    
}

extension FirstViewController: BaseSignUpViewControllerDelegate {
    func didReceiveData(model: Model) {
        let secondView = SecondViewController(model: model)
        navigationController?.pushViewController(secondView, animated: true)
    }
}
