//
//  PhotoCarouselView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit

final class PhotoCarouselView: UIView {
    
    private var imageUrls: [URL]
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()
    private lazy var photoCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: PhotoCollectionCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = R.Colors.Default.subtitleText
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundColor = .white
        pageControl.clipsToBounds = true
        pageControl.layer.cornerRadius = 5
        return pageControl
    }()
    
    init(imageUrls: [URL]) {
        self.imageUrls = imageUrls
        super.init(frame: .zero)
        pageControl.numberOfPages = imageUrls.count
        setup()
        
    }
    
    
    func setup() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = .black
        setupCollectionView()
        setupPageControl()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        addView(photoCollection)
        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: topAnchor),
            photoCollection.leftAnchor.constraint(equalTo: leftAnchor),
            photoCollection.rightAnchor.constraint(equalTo: rightAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func setupPageControl(){
        addView(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: photoCollection.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: photoCollection.bottomAnchor, constant: -5).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
}
extension PhotoCarouselView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.identifier, for: indexPath) as! PhotoCollectionCell
        cell.setup(url: imageUrls[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
}
