//
//  ViewController.swift
//  ChallengeHolerite
//
//  Created by Ellington Cavalcante on 13/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
//        screen?.configTextField()
        screen?.configButtonEnable(false)
        settings()
    }

    
    private func settings() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension HomeViewController: HomeScreenProtocol {
    func actionCalculateButton() {
        screen?.cleanTextfield()
        let screen: CalculateViewController = CalculateViewController()
        screen.modalPresentationStyle = .formSheet
        self.present(screen, animated: true)
    }
}




