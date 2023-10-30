//
//  SecondViewController.swift
//  OnboardingCreation
//
//  Created by Cesar Humberto Grifaldo Garcia on 17/10/23.
//

import UIKit

final class SecondViewController: BaseSignUpViewController {
    private var model: Model
    
    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second View"
        setupSecondView()
        print(model.firstName ?? "")
    }
    
    override func continueNextView() {
        model.email = getDataTextFieldText
        let thirdView = ThirdViewController(model: model)
        navigationController?.pushViewController(thirdView, animated: true)
    }
    
    private func setupSecondView() {
        self.configure(titleText: "Enter your email",
                       descriptionText: "Enter your email to continue to create to your account",
                       placeholderText: "Enter your email")
    }
    
}
