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
        
    }
    



}

