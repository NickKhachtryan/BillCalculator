//
//  TotalBillView.swift
//  BillCalculator
//
//  Created by Nick Khachatryan on 05.05.2023.
//

import UIKit
final class TotalBillView: UIView {
    
    
    // MARK: Private Properties
    
    private let totalBillLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: Public Properties
    
    let sumTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        textField.font = UIFont(name: "Avenir Next Bold", size: 56)
        textField.keyboardType = .numberPad
        textField.textColor = .black
        textField.tintColor = #colorLiteral(red: 0.5036851764, green: 0.3296453357, blue: 0.3984515667, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    // MARK: Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Layout Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        totalBillLabel.font = UIFont(name: "Avenir Next", size: frame.width / 25)
        sumTextField.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.1)
        
    }
    
    
    // MARK: Private Methods
    
    private func setUpView(){
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(totalBillLabel)
        addSubview(sumTextField)
    }
    
    
    // MARK: Constraints
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            totalBillLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            totalBillLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            totalBillLabel.heightAnchor.constraint(equalToConstant: 20),
            
            sumTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            sumTextField.widthAnchor.constraint(equalTo: widthAnchor),
            sumTextField.topAnchor.constraint(equalTo: totalBillLabel.bottomAnchor, constant: 3),
            sumTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
