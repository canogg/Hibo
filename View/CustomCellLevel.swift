//
//  CustomCellSecond.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 17/10/22.
//

import UIKit

class CustomCellLevel: UICollectionViewCell {
    
    var didTapNextPage: (() -> Void)?
    
    fileprivate let cardimage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(cardimage)
        
        configureContraints()
        func configureContraints() {
            NSLayoutConstraint.activate([
                cardimage.topAnchor.constraint(equalTo: contentView.topAnchor),
                cardimage.centerXAnchor.constraint(equalTo: centerXAnchor),
                cardimage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                cardimage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                cardimage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func config(model: CustomDataLevel) {
        //buttonCell.setTitle(model.title, for: .normal)
        //buttonCell.backgroundColor = model.buttonColor
        cardimage.image = model.image
    }
}
