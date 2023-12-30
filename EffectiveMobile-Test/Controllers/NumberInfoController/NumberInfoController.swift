//
//  InfoController.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 23.12.2023.
//

import UIKit

final class NumberInfoController: UIViewController {
    private var roomsArray: RoomsModel? = nil
    
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView();
    private let flowLayout: UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.delegate = self
        
        collection.dataSource = self
        collection.register(NumberInfroCollectionViewCell.self, forCellWithReuseIdentifier: NumberInfroCollectionViewCell.identifier)
        collection.backgroundColor = R.Colors.Default.background
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Colors.Default.background
        title = "Номера"
        startLoading()
        NetworkManager.shared.fetchNumber { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let rooms):
                self.stopLoading()
                self.roomsArray = rooms
                setup()
            case .failure(let failure):
                self.stopLoading()
                let alertController = UIAlertController(title: "Error", message: "\(failure.localizedDescription)", preferredStyle: .actionSheet)
                present(alertController, animated: true)
                
            }
        }
    }
    func setup() {
        view.addView(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}
// MARK:  Activity Indicator

extension NumberInfoController {
    func startLoading(){
        
        activityIndicator.style = .medium;
        activityIndicator.color = .white
        view.addView(activityIndicator);
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.startAnimating();
    }
    func stopLoading(){
        activityIndicator.stopAnimating();
        activityIndicator.removeFromSuperview()

    }
}
// MARK:  CollectionView

extension NumberInfoController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roomsArray?.rooms.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let room = roomsArray?.rooms {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberInfroCollectionViewCell.identifier, for: indexPath) as! NumberInfroCollectionViewCell
            cell.navigationController = self.navigationController
            cell.configure(number: room[indexPath.row])
            print(cell.frame)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height * 0.63)
    }
}
