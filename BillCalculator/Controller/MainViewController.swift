//
//  ViewController.swift
//  BillCalculator
//
//  Created by Nick Khachatryan on 05.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    // MARK: Private properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var calculateButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.5036851764, green: 0.3296453357, blue: 0.3984515667, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let totalBillView = TotalBillView()
    private let countPersonView = CountPersonsView()
    private let tipsView = TipsView()
    
    
    // MARK: ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
        addTap()
    }
    
    private func setUpViews(){
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: view.frame.height / 21)
        
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        descriptionLabel.font = UIFont(name: "Avenir Next Bold", size: view.frame.height / 55)
        
        view.addSubview(totalBillView)
        view.addSubview(countPersonView)
        view.addSubview(tipsView)
        view.addSubview(calculateButton)
        
    }
    
    
    // MARK: Actions
    
    @objc func calculateButtonTapped(){
        guard let totalBill = totalBillView.sumTextField.text,
              let totalBillInt = Int(totalBill) else { return }
        
        let sum = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = countPersonView.counter
        let result = sum / persons
        descriptionLabel.text = "\(result) per person"
    }
    
    func addTap() {
        let tap = UIGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}

// MARK: Constraints

extension MainViewController {
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBillView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.855),
            totalBillView.centerXAnchor.constraint(equalTo: descriptionLabel.centerXAnchor),
            totalBillView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
            
            countPersonView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            countPersonView.widthAnchor.constraint(equalTo: totalBillView.widthAnchor, multiplier: 1),
            countPersonView.heightAnchor.constraint(equalTo: totalBillView.heightAnchor, multiplier: 1),
            countPersonView.centerXAnchor.constraint(equalTo: totalBillView.centerXAnchor),
            
            tipsView.topAnchor.constraint(equalTo: countPersonView.bottomAnchor, constant: 10),
            tipsView.centerXAnchor.constraint(equalTo: countPersonView.centerXAnchor),
            tipsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.855),
            tipsView.heightAnchor.constraint(equalTo: totalBillView.heightAnchor, multiplier: 1),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 10),
            calculateButton.centerXAnchor.constraint(equalTo: countPersonView.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.855),
            calculateButton.heightAnchor.constraint(equalTo: totalBillView.heightAnchor, multiplier: 0.6)
            
            
        ])
    }
}
