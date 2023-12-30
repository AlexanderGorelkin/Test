//
//  TouristView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 28.12.2023.
//

import UIKit




final class TouristView: UIView, ShowTouristInfoDelegate {
    
    
    private let textFieldArray: [String] = ["Имя", "Фамилия", "Дата рождения", "Гражданство", "Номер загранпаспорта", "Срок действия загранпаспорта"]
    private var isHiddenView: Bool = false
    
    // MARK:  Views
    
    private lazy var touristCollectionView: DynamicHeightCollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        
        
        let collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TouristCollectionViewCell.self, forCellWithReuseIdentifier: TouristCollectionViewCell.identifier)
        
        return collectionView
    }()
    private var touristButton: ToursitButton
       
    private lazy var touristStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.addArrangedSubview(touristButton)
        stackView.addArrangedSubview(touristCollectionView)
        return stackView
    }()
    
    
    init(numberOfTourist: String) {
        touristButton = ToursitButton(type: .touristButtom, numberOfTourist: numberOfTourist)
        super.init(frame: .zero)
        layer.cornerRadius = 12
        touristButton.showDelegate = self
        touristCollectionView.isHidden = isHiddenView
        backgroundColor = .white
        addView(touristStackView)
        NSLayoutConstraint.activate([
            
            touristStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            touristStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            touristStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            touristStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func onButtonClick(_ sender: UIButton) {
        showTouristInfo()
    }
    func showTouristInfo() {
        isHiddenView.toggle()
        animate(toogle: isHiddenView)
    }
    
    private func animate(toogle: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear, .beginFromCurrentState], animations: { [weak self] in
            self?.touristCollectionView.isHidden = toogle
        }, completion: nil)
    }
    
    
}
extension TouristView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textFieldArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TouristCollectionViewCell.identifier, for: indexPath) as! TouristCollectionViewCell
        cell.configure(placeholderText: textFieldArray[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
}
