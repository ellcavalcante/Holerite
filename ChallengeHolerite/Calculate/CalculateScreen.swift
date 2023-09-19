//
//  CalculateScreen.swift
//  ChallengeHolerite
//
//  Created by Ellington Cavalcante on 14/09/23.
//

import UIKit

protocol CalculateScreenProtocol: AnyObject {
    func actionCloseButton()
}

class CalculateScreen: UIView {
    
    var delegate: CalculateScreenProtocol?
    
    public lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("FECHAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return button
    }()
    
    
    @objc func tappedCloseButton(){
        delegate?.actionCloseButton()
    }
    
    public lazy var resultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = false
        tableView.register(CalculateTableViewCell.self, forCellReuseIdentifier: CalculateTableViewCell.identifier)
        return tableView
    }()

    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        resultsTableView.delegate = delegate
        resultsTableView.dataSource = dataSource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(closeButton)
        addSubview(resultsTableView)
        backgroundColor()
        setUpConstraints()
    }
    
    private func backgroundColor() {
        backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            closeButton.heightAnchor.constraint(equalToConstant: 18),
            closeButton.widthAnchor.constraint(equalToConstant: 65),
            
            resultsTableView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 28),
            resultsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            resultsTableView.heightAnchor.constraint(equalToConstant: 349)
            
        ])
    }
}
