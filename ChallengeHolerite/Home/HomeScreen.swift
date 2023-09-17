//
//  HomeScreen.swift
//  ChallengeHolerite
//
//  Created by Ellington Cavalcante on 13/09/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionCalculateButton()
}

class HomeScreen: UIView {
    
    var delegate: HomeScreenProtocol?
    
    private lazy var topWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Holerite"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let stackViewTextFields: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    var entrySalaryValue: Double {
        if let salaryNumber = valueFormatted(incomeText: salaryTextField.text ?? ""), salaryTextField.text?.isEmpty == false {
            return salaryNumber
        }
        return 0
    }
    
    public lazy var salaryTextField: UITextField = {
        let salary = UITextField()
        salary.translatesAutoresizingMaskIntoConstraints = false
        salary.autocorrectionType = .no
        salary.backgroundColor = .white
        salary.borderStyle = .roundedRect
        salary.autocapitalizationType = .none
        salary.keyboardType = .numberPad
        salary.placeholder = "Salário bruto"
        salary.textColor = .darkGray
        salary.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        salary.addTarget(self, action: #selector(configTextField), for: .editingChanged)
        return salary
    }()
    
    var discountValue: Double {
        if let discountNumber = valueFormatted(incomeText: discountsTextField.text ?? ""), discountsTextField.text?.isEmpty == false {
            return discountNumber
        }
        return 0
    }
    
    public lazy var discountsTextField: UITextField = {
        let discounts = UITextField()
        discounts.translatesAutoresizingMaskIntoConstraints = false
        discounts.autocorrectionType = .no
        discounts.backgroundColor = .white
        discounts.borderStyle = .roundedRect
        discounts.autocapitalizationType = .none
        discounts.keyboardType = .numberPad
        discounts.placeholder = "Descontos"
        discounts.textColor = .darkGray
        discounts.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        discounts.addTarget(self, action: #selector(configTextField), for: .editingChanged)
        return discounts
    }()
    
    private func configureStackView() {
        stackViewTextFields.addArrangedSubview(salaryTextField)
        stackViewTextFields.addArrangedSubview(discountsTextField)
    }
    
    public lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CALCULAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCalculateButton() {
        delegate?.actionCalculateButton()
    }
    
    @objc func configTextField(_ textField: UITextField) {
        
        let currency = textField.text?.currencyInputFormatting()
        textField.text = currency
        
        let salary: String = salaryTextField.text ?? ""
        let discounts: String = discountsTextField.text ?? ""
        
        if (!salary.isEmpty && !discounts.isEmpty) {
            configButtonEnable(true)
            return
        } else {
            configButtonEnable(false)
        }
    }
    
    func valueFormatted(incomeText: String) -> Double? {
        let str = incomeText
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return Double(truncating: formatter.number(from: str) ?? 0 )
    }
    
    public func configButtonEnable(_ enable: Bool) {
        if enable {
            calculateButton.backgroundColor = .blue
            calculateButton.isEnabled = true
        } else {
            calculateButton.backgroundColor = UIColor(red: 79/255, green: 166/255, blue: 246/255, alpha: 1.0)
            calculateButton.isEnabled = false
        }
    }
    
    public func cleanTextfield() {
        salaryTextField.text = ""
        salaryTextField.resignFirstResponder()
        
        discountsTextField.text = ""
        discountsTextField.resignFirstResponder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(topWhiteView)
        addSubview(topView)
        addSubview(titleLabel)
        addSubview(stackViewTextFields)
        addSubview(calculateButton)
        configureStackView()
        backgroundColor()
        setUpConstraints()
    }
    
    private func backgroundColor() {
        backgroundColor = UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor),
            topView.heightAnchor.constraint(equalToConstant: 50),
            
            topWhiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topWhiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topWhiteView.topAnchor.constraint(equalTo: topAnchor),
            topWhiteView.heightAnchor.constraint(equalToConstant: 55),
            
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            
            salaryTextField.heightAnchor.constraint(equalToConstant: 44),
            
            stackViewTextFields.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            stackViewTextFields.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            stackViewTextFields.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            calculateButton.topAnchor.constraint(equalTo: stackViewTextFields.bottomAnchor, constant: 22),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}

