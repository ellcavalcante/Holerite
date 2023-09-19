//
//  CalculateViewController.swift
//  ChallengeHolerite
//
//  Created by Ellington Cavalcante on 14/09/23.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var screen: CalculateScreen?
    var cell: CalculateTableViewCell = CalculateTableViewCell()
    var itens: [ItensHolerite] = [ItensHolerite(itens: "Salário bruto"),
                                   ItensHolerite(itens: "Descontos"),
                                   ItensHolerite(itens: "Desconto INSS"),
                                   ItensHolerite(itens: "Desconto IRRF"),
                                   ItensHolerite(itens: "Salário líquido")]
    var entrySalaryText: Double
    var discountValue: Double
    
    init(entrySalary: Double, discounts: Double) {
        
        self.entrySalaryText = entrySalary
        self.discountValue = discounts
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", entrySalaryText)
            cell?.selectionStyle = .none
            cell?.valueLabel.textColor = UIColor(red: 66/255, green: 166/255, blue: 64/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            cell?.valueLabel.attributedText = NSAttributedString(string: "R$ \(discountValue)", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", discountValue)
            cell?.valueLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            cell?.valueLabel.textColor = UIColor(red: 219/255, green: 66/255, blue: 57/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            cell?.valueLabel.attributedText = NSAttributedString(string: "R$ \(discountValue)", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", discountValue)
            cell?.valueLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", entrySalaryText)
            cell?.valueLabel.textColor = UIColor(red: 66/255, green: 166/255, blue: 64/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
