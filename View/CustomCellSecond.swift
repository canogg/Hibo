//
//  CustomCellSecond.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 17/10/22.
//

import UIKit

class CustomCellSecond: UICollectionViewCell {

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
                self.cardimage.heightAnchor.constraint(equalToConstant: 120),

            ])
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func config(model: CustomDataSecond) {
        //buttonCell.setTitle(model.title, for: .normal)
        //buttonCell.backgroundColor = model.buttonColor
        cardimage.image = model.image
    }
}
