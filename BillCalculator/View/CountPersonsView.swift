//
//  CountPersonsView.swift
//  BillCalculator
//
//  Created by Nick Khachatryan on 05.05.2023.
//

import UIKit

final class CountPersonsView : UIView {
    
    
    // MARK: Private Properties
    
    private let personLabel : UILabel = {
       let label = UILabel()
        label.text = "Person"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backgroundGrayView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var minusButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("—", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var plusButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let counterLabel: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: Public Properties
    
    var counter = 1
    
    
    // MARK: Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Layout methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        counterLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.1)
        minusButton.titleLabel?.font = UIFont(name: "Avenir Next", size: frame.height / 2)
        plusButton.titleLabel?.font = UIFont(name: "Avenir Next", size: frame.height / 2)
        personLabel.font = UIFont(name: "Avenir Next", size: frame.width / 25)
    }
    
    
    // MARK: Actions
    
    @objc func minusButtonTapped(){
        
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter == 1 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped(){
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
    }

    
    // MARK: Private Methods
    
    private func setUpView(){
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(personLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }
    
    
    // MARK: Constraints
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            personLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            personLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            personLabel.heightAnchor.constraint(equalToConstant: 20),

            backgroundGrayView.topAnchor.constraint(equalTo: personLabel.bottomAnchor, constant: 3),
            backgroundGrayView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundGrayView.widthAnchor.constraint(equalTo: widthAnchor),
            backgroundGrayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalTo: backgroundGrayView.widthAnchor, multiplier: 0.2),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalTo: backgroundGrayView.widthAnchor, multiplier: 0.2),
            
            counterLabel.centerXAnchor.constraint(equalTo: backgroundGrayView.centerXAnchor),
            counterLabel.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            counterLabel.widthAnchor.constraint(equalTo: backgroundGrayView.widthAnchor, multiplier: 0.6)
            ])
    }
}
