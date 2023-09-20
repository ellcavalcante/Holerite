//
//  CalculateTableViewCell.swift
//  ChallengeHolerite
//
//  Created by Ellington Cavalcante on 14/09/23.
//

import UIKit

class CalculateTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: CalculateTableViewCell.self)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    public lazy var entryTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Salário bruto"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var subTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8%"
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 2.000"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()

    public func setUpCell(data: ItensHolerite) {
        self.entryTextLabel.text = data.itens
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        stackView.addArrangedSubview(entryTextLabel)
        stackView.addArrangedSubview(subTextLabel)
    }
    
    private func addSubview() {
        addSubview(stackView)
        addSubview(valueLabel)
        configureStackView()
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            
        ])
    }
}
