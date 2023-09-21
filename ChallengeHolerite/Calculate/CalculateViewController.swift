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
    
    func calculateIRRF(entrySalary: Double) -> (Double, String) {
        if entrySalary <= 1903.98 {
            return (entrySalary * 0.0, "0%")
        } else if entrySalary >= 1903.99 && entrySalary <= 2826.65  {
            return (entrySalary * 0.075, "7,5%")
        } else if entrySalary >= 2826.66 && entrySalary <= 3751.05 {
            return (entrySalary * 0.15, "15%")
        } else if entrySalary >= 3751.06 && entrySalary <= 4664.68 {
            return (entrySalary * 0.225, "22,5%")
        } else {
            return (entrySalary * 0.275, "27,5%")
        }
    }
    
    func calculateINSS(_ entrySalary: Double) -> (Double, String) {
        if entrySalaryText <= 1302.00 {
            return (entrySalaryText * 0.075, "7,5%")
        } else if entrySalaryText >= 1302.01 && entrySalaryText <= 2427.35  {
            return (entrySalaryText * 0.09, "9%")
        } else if entrySalaryText >= 2427.36 && entrySalaryText <= 3641.03 {
            return (entrySalaryText * 0.12, "12%")
        } else {
            return (entrySalaryText * 0.14, "14%")
        }
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
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", discountValue)
            cell?.subTextLabel.isHidden = true
            if discountValue == 0.0 {
                cell?.valueLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)
                cell?.valueLabel.attributedText = NSAttributedString(string: "R$ \(discountValue)", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            } else {
                cell?.valueLabel.textColor = UIColor(red: 219/255, green: 66/255, blue: 57/255, alpha: 1.0)
            }
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            let INSS = calculateINSS(entrySalaryText)
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", INSS.0)
            cell?.subTextLabel.text = INSS.1
            cell?.valueLabel.textColor = UIColor(red: 219/255, green: 66/255, blue: 57/255, alpha: 1.0)
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            let IRRF = calculateIRRF(entrySalary: entrySalaryText)
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", IRRF.0)
            cell?.subTextLabel.text = IRRF.1
            if IRRF.0 == 0.0 {
                cell?.valueLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)
                cell?.valueLabel.attributedText = NSAttributedString(string: "R$ \(IRRF.0)", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            } else {
                cell?.valueLabel.textColor = UIColor(red: 219/255, green: 66/255, blue: 57/255, alpha: 1.0)
            }
            
            return cell ?? UITableViewCell()
        }
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalculateTableViewCell.identifier, for: indexPath) as? CalculateTableViewCell
            cell?.setUpCell(data: itens[indexPath.row])
            cell?.selectionStyle = .none
            var total = entrySalaryText
            let IRRF = calculateIRRF(entrySalary: entrySalaryText)
            total -= IRRF.0
            total -= discountValue
            let INSS = calculateINSS(entrySalaryText)
            total -= INSS.0
            cell?.valueLabel.text = "R$ " + String(format: "%.2f", total)
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
