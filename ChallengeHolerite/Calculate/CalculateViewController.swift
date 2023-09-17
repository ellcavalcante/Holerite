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
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
     
    }
}

extension CalculateViewController: CalculateScreenProtocol {
    func actionCloseButton() {
        dismiss(animated: true)
    }
}

extension CalculateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
//        cell?.setUpCell(data: categoryViewModel.requestCategories[indexPath.row])
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
