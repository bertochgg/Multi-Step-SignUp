//
//  ViewController.swift
//  OnboardingCreation
//
//  Created by Cesar Humberto Grifaldo Garcia on 17/10/23.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy private var welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = "Welcome"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.center = view.center
        label.textColor = .white
        return label
    }()
    
    lazy private var button: UIButton = {
        let button = UIButton(frame: CGRect(x: view.frame.width / 2, y: view.frame.height / 6, width: 100, height: 100))
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemPink
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a button to push to the next view controller
        view.backgroundColor = .blue
        view.addSubview(welcomeLabel)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)

    }
    
    @objc
    func pushButtonTapped() {
        let firstViewController = FirstViewController()
        navigationController?.pushViewController(firstViewController, animated: true)
    }
}

