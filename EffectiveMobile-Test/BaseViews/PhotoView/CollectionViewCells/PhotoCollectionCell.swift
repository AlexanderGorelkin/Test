//
//  PhotoCollectionCell.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit

final class PhotoCollectionCell: UICollectionViewCell {
    let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();
    static let identifier = String(describing: PhotoCollectionCell.self)
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView(imageView)
        NSLayoutConstraint.activate([
           imageView.topAnchor.constraint(equalTo: topAnchor),
           imageView.leftAnchor.constraint(equalTo: leftAnchor),
           imageView.rightAnchor.constraint(equalTo: rightAnchor),
           imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func setup(url: URL) {
        startLoading()
        imageView.setImage(url: url) { bool in
            self.stopLoading()
        }
    }
    func startLoading(){
        
        activityIndicator.style = .medium;
        activityIndicator.color = .white
        imageView.addView(activityIndicator);
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicator.startAnimating();
        

    }
    func stopLoading(){
        activityIndicator.stopAnimating();
        activityIndicator.removeFromSuperview()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
