//
//  CellView.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 17/10/22.
//

import Foundation
import UIKit

class CustomCellIdioma: UICollectionViewCell {
    
    
    var didTapNextPage: (() -> Void)?
    
    fileprivate let cardimage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    fileprivate let buttonCell : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(nextpage), for: .touchUpInside)
        return button
    }()
    
    @objc func nextpage(sender: UIButton) {
        didTapNextPage?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(cardimage)
        contentView.addSubview(buttonCell)
        
        configureContraints()
        func configureContraints() {
            NSLayoutConstraint.activate([
                cardimage.topAnchor.constraint(equalTo: contentView.topAnchor),
                cardimage.centerXAnchor.constraint(equalTo: centerXAnchor),
                cardimage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                cardimage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                self.cardimage.heightAnchor.constraint(equalToConstant: 200),
                
                self.buttonCell.topAnchor.constraint(equalTo: self.cardimage.bottomAnchor, constant: -2),
                self.buttonCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                self.buttonCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                self.buttonCell.heightAnchor.constraint(equalToConstant: 40),
                self.buttonCell.widthAnchor.constraint(equalToConstant: 40),
            ])
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(model: CustomDataIdioma) {
        buttonCell.setTitle(model.title, for: .normal)
        buttonCell.backgroundColor = model.buttonColor
        cardimage.image = model.image
    }
}
