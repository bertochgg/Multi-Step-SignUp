//
//  ThirdViewController.swift
//  OnboardingCreation
//
//  Created by Cesar Humberto Grifaldo Garcia on 18/10/23.
//

import UIKit

final class ThirdViewController: BaseSignUpViewController {
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
        setupThirdView()
        print(model.firstName ?? "")
        print(model.email ?? "")
    }
    
    override func continueNextView() {
        model.password = getDataTextFieldText
        print("Finalize")
        print(model)
    }
    
    private func setupThirdView() {
        self.configure(titleText: "Create your password",
                       descriptionText: "Create your password to continue to create to your account",
                       placeholderText: "Create your password")
    }

}
