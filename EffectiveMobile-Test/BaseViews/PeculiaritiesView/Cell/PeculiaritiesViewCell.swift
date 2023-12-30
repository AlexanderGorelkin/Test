//
//  PeculiaritiesViewCell.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit

final class PeculiaritiesViewCell: UICollectionViewCell {
    static let identifier = String(describing: PeculiaritiesViewCell.self)
    
    private lazy var peculiarityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Hello"
        label.textColor = R.Colors.Default.subtitleText
        return label
    }()
    
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        backgroundColor = R.Colors.NonActiveColor.backgroundColor
        addView(peculiarityLabel)
        NSLayoutConstraint.activate([
            peculiarityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            peculiarityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            peculiarityLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            peculiarityLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(peculiarity: String) {
        self.peculiarityLabel.text = peculiarity
        
    }
}
