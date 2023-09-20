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
    var inss: Double = 0
    
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
            cell?.subTextLabel.isHidden = true
            cell?.valueLabel.textColor = UIColor(red: 66/255, green: 166/255, blue: 64/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            cell?.valueLabel.attributedText = NSAttributedString(string: "R$ \(discountValue)", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", discountValue)
            cell?.subTextLabel.isHidden = true
            cell?.valueLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            if entrySalaryText <= 1302.00 {
                cell?.subTextLabel.text = "7,5%"
                let resultINSS = entrySalaryText * 0.075
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultINSS)
            } else if entrySalaryText >= 1302.01 && entrySalaryText <= 2427.35  {
                cell?.subTextLabel.text = "9%"
                let resultINSS = entrySalaryText * 0.09
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultINSS)
            } else if entrySalaryText >= 2427.36 && entrySalaryText <= 3641.03 {
                cell?.subTextLabel.text = "12%"
                let resultINSS = entrySalaryText * 0.12
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultINSS)
            } else if entrySalaryText >= 3641.03 && entrySalaryText <= 7087.22 {
                cell?.subTextLabel.text = "14%"
                let resultINSS = entrySalaryText * 0.14
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultINSS)
            }
            cell?.valueLabel.textColor = UIColor(red: 219/255, green: 66/255, blue: 57/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            cell?.valueLabel.attributedText = NSAttributedString(string: "R$ \(discountValue)", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", discountValue)
            if entrySalaryText <= 1903.98 {
                cell?.subTextLabel.text = "0%"
                let resultIRRF = entrySalaryText * 0.0
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultIRRF)
            } else if entrySalaryText >= 1903.99 && entrySalaryText <= 2826.65  {
                cell?.subTextLabel.text = "7,5%"
                let resultIRRF = entrySalaryText * 0.075
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultIRRF)
            } else if entrySalaryText >= 2826.66 && entrySalaryText <= 3751.05 {
                cell?.subTextLabel.text = "15%"
                let resultIRRF = entrySalaryText * 0.15
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultIRRF)
            } else if entrySalaryText >= 3751.06 && entrySalaryText <= 4664.68 {
                cell?.subTextLabel.text = "22,5%"
                let resultIRRF = entrySalaryText * 0.225
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultIRRF)
            } else if entrySalaryText > 4664.68 {
                cell?.subTextLabel.text = "27,5%"
                let resultIRRF = entrySalaryText * 0.275
                cell?.valueLabel.text = "R$ " + String(format: "%.2f", resultIRRF)
            }
            cell?.valueLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", entrySalaryText)
            cell?.subTextLabel.isHidden = true
            cell?.valueLabel.textColor = UIColor(red: 66/255, green: 166/255, blue: 64/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
