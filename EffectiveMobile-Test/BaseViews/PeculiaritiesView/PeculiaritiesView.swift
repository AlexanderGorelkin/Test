//
//  PeculiaritiesView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}


final class PeculiaritiesView: UIView {
    
    private var peculiaritiesArray: [String] = []
    
    private lazy var peculiaritiesCollectionView: UICollectionView = {
        var flowLayout = TagFlowLayout()
        flowLayout.minimumLineSpacing = 8
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
       
        let collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(PeculiaritiesViewCell.self, forCellWithReuseIdentifier: PeculiaritiesViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isUserInteractionEnabled = false
        return collectionView
    }()
    
    
    
    init(peculiaritiesArray: [String]) {
        self.peculiaritiesArray = peculiaritiesArray
        super.init(frame: .zero)
        addView(peculiaritiesCollectionView)
        NSLayoutConstraint.activate([
            peculiaritiesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            peculiaritiesCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            peculiaritiesCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            peculiaritiesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension PeculiaritiesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peculiaritiesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeculiaritiesViewCell.identifier, for: indexPath) as! PeculiaritiesViewCell
        cell.setup(peculiarity: peculiaritiesArray[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
    
    
}

