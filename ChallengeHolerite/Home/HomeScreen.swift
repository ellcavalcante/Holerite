//
//  HomeScreen.swift
//  ChallengeHolerite
//
//  Created by Ellington Cavalcante on 13/09/23.
//

import UIKit

class HomeScreen: UIView {
    
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
        backgroundColor()
        setUpConstraints()
    }
    
    private func backgroundColor() {
        backgroundColor = UIColor(red: 148/255, green: 152/255, blue: 155/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor),
            topView.heightAnchor.constraint(equalToConstant: 45),
            
            topWhiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topWhiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topWhiteView.topAnchor.constraint(equalTo: topAnchor),
            topWhiteView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            
        ])
    }
}
