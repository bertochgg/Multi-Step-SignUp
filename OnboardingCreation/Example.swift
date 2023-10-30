//
//  Example.swift
//  OnboardingCreation
//
//  Created by Cesar Humberto Grifaldo Garcia on 17/10/23.
//

import UIKit

class ExampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a button to push to the next view controller
        view.backgroundColor = .systemPink
        let pushButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        pushButton.backgroundColor = .white
        pushButton.setTitleColor(.black, for: .normal)
        pushButton.setTitle("Push", for: .normal)
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        pushButton.center = view.center
        view.addSubview(pushButton)
    }

    @objc func pushButtonTapped() {
        let nextViewController = NextViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

class NextViewController: UIViewController {
    
    lazy private var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        button.center = view.center
        return button
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Next View"
        view.backgroundColor = .cyan
        view.addSubview(button)
    }
    
    @objc func pushButtonTapped() {
        let nextViewController = ThirdViewControllerO()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

class ThirdViewControllerO: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Third View"
        view.backgroundColor = .lightGray
    }
    
}

