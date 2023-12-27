//
//  NonActiveView.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 26.12.2023.
//

import UIKit
struct NonActiveViewModel {

    let leftLogo: UIImage
    let topLabel: String
    let bottomLabel: String
}

final class NonActiveView: UIView {
    private lazy var leftLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = R.Colors.NonActiveColor.topLabelCount
        return imageView
    }()
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Elj,c"
        label.textColor = R.Colors.NonActiveColor.topLabelCount
        return label
    }()
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.text = "Elj,c"
        label.textColor = R.Colors.NonActiveColor.bottomLabelColor
        return label
    }()
    private lazy var rightLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = R.Colors.NonActiveColor.topLabelCount
        return imageView
    }()
    
    private lazy var labelsStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(bottomLabel)
        return stackView
    }()
    private lazy var chevronAndLabelsStack: UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.distribution = .fillProportionally
         stackView.alignment = .center
         stackView.addArrangedSubview(labelsStack)
         stackView.addArrangedSubview(rightLogo)
        stackView.addBottomLine()
         return stackView
     }()
    private lazy var fullStack: UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .horizontal
        stackView.spacing = 10
         stackView.distribution = .fillProportionally
         stackView.alignment = .center
         stackView.addArrangedSubview(leftLogo)
         stackView.addArrangedSubview(chevronAndLabelsStack)
         return stackView
     }()
    
   
    
    
    
    init(model: NonActiveViewModel) {
        super.init(frame: .zero)
        self.topLabel.text = model.topLabel
        self.bottomLabel.text = model.bottomLabel
        self.leftLogo.image = model.leftLogo
        addView(fullStack)
        NSLayoutConstraint.activate([
            fullStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            fullStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            fullStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            fullStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
