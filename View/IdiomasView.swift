//
//  FirstView.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import UIKit

/*Classe responsável por introduzir o usuário ao app e permitir que ele escolha o idioma que gostaria
 de praticar
 */
class IdiomasView: UIView {
    lazy var introLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 58)
        label.text = "Hi, Bonjour!"
        return label
    }()
    lazy var balaoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "balao")
        return image
    }()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CustomCellIdioma.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(introLabel)
        self.addSubview(balaoImage)
        self.addSubview(collectionView)
        self.configConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.introLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 45),
            self.introLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.balaoImage.topAnchor.constraint(equalTo: self.introLabel.bottomAnchor, constant: 30),
            self.balaoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.balaoImage.widthAnchor.constraint(equalToConstant: 380),
            self.balaoImage.heightAnchor.constraint(equalToConstant: 200),
            self.collectionView.topAnchor.constraint(equalTo: balaoImage.bottomAnchor, constant: -15),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 281)
        ])
    }
}
