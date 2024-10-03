//
//  TipsView.swift
//  BillCalculator
//
//  Created by Nick Khachatryan on 06.05.2023.
//

import UIKit

final class TipsView : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: Private Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Tips"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tipsCollection : UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.layer.cornerRadius = 10
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let tipsArray = ["0%", "10%", "15%", "20%"]
    
    
    // MARK: Public Methods
    
    var tipsCount = 0
    
    
    // MARK: Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Layout methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 25)
    }
    
    
    // MARK: Private methods
    
    private func setUpViews(){
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(tipsCollection)
        tipsCollection.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setDelegates(){
        tipsCollection.delegate = self
        tipsCollection.dataSource = self
    }
    
    
    // MARK: CollectionView methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionViewLayout.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        return CGSize(width: collectionView.frame.width / 4.2,
                      height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.tipsProcentLabel.text = tipsArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            tipsCount = 0
        case 1 :
            tipsCount = 10
        case 2 :
            tipsCount = 15
        case 3 :
            tipsCount = 20
        default:
            print("Error")
        }
    }
}


// MARK: Constraints

extension TipsView {
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            tipsCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            tipsCollection.centerXAnchor.constraint(equalTo: centerXAnchor),
            tipsCollection.widthAnchor.constraint(equalTo: widthAnchor),
            tipsCollection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
            
        ])
    }
}

