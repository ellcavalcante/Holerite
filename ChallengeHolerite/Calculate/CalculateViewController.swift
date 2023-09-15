//
//  CalculateViewController.swift
//  ChallengeHolerite
//
//  Created by Ellington Cavalcante on 14/09/23.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var screen: CalculateScreen?
    
    override func loadView() {
        screen = CalculateScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
     
    }
}

extension CalculateViewController: CalculateScreenProtocol {
    func actionCloseButton() {
        dismiss(animated: true)
    }
}
