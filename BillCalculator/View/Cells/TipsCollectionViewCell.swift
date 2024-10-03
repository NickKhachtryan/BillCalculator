//
//  TipsCollectionViewCell.swift
//  BillCalculator
//
//  Created by Nick Khachatryan on 06.05.2023.
//

import UIKit

final class TipsCollectionViewCell: UICollectionViewCell{
    
    
    // MARK: Public properties
    
    let tipsProcentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Bold", size: 30)
        label.textColor = .black
        label.text = "10%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.5036851764, green: 0.3296453357, blue: 0.3984515667, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    
    // MARK: Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Private methods
    
    private func setUpView(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        layer.cornerRadius = 10
        addSubview(tipsProcentLabel)
    }
    
    
    // MARK: Layout methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tipsProcentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3)

    }
    
    
    // MARK: Constraints
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            tipsProcentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tipsProcentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
