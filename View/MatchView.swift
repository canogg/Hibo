//
//  ThirdView.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import UIKit

class MatchView: UIView {
    
    var didTapNextPage: (() -> Void)?
    
    lazy var introLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.text = "It's a Match!"
        return label
        
    }()
    
    lazy var nameEsquerdaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = UserDefaults.standard.getPersonName()
        return label
        
    }()
    
    lazy var avatarImageCarol: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        Task {
            let imageData = await API.getImage(name: "caroline")
            imageView.image = UIImage(data: imageData)
            imageView.layer.cornerRadius = 9
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.gray.cgColor
            
        }
        return imageView
    }()
    
    lazy var versosImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "x")
        
        return image
    }()
    
    lazy var avatarImageCarla: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        Task {
            let imageData = await API.getImage(name: "carla")
            imageView.image = UIImage(data: imageData)
            imageView.layer.cornerRadius = 9
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.gray.cgColor
            
        }
        return imageView
    }()
    
    lazy var reuniaoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Sua Reunião"
        return label
        
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(introLabel)
        self.addSubview(avatarImageCarol)
        self.addSubview(versosImage)
        self.addSubview(avatarImageCarla)
        self.addSubview(reuniaoLabel)
        self.addSubview(nameEsquerdaLabel)
        self.configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.introLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25),
            self.introLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.nameEsquerdaLabel.topAnchor.constraint(equalTo: self.introLabel.bottomAnchor, constant: 10),
            self.nameEsquerdaLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.nameEsquerdaLabel.widthAnchor.constraint(equalToConstant: 90),
            self.nameEsquerdaLabel.heightAnchor.constraint(equalToConstant: 90),
            
            self.avatarImageCarol.topAnchor.constraint(equalTo: self.introLabel.bottomAnchor, constant: 80),
            self.avatarImageCarol.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.avatarImageCarol.widthAnchor.constraint(equalToConstant: 90),
            self.avatarImageCarol.heightAnchor.constraint(equalToConstant: 90),
            
            self.versosImage.topAnchor.constraint(equalTo: self.introLabel.bottomAnchor, constant: 150),
            self.versosImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.versosImage.widthAnchor.constraint(equalToConstant: 20),
            self.versosImage.heightAnchor.constraint(equalToConstant: 20),
            
            self.avatarImageCarla.topAnchor.constraint(equalTo: self.introLabel.bottomAnchor, constant: 80),
            self.avatarImageCarla.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.avatarImageCarla.widthAnchor.constraint(equalToConstant: 90),
            self.avatarImageCarla.heightAnchor.constraint(equalToConstant: 90),
            
            self.reuniaoLabel.topAnchor.constraint(equalTo: self.avatarImageCarol.bottomAnchor, constant: 50),
            self.reuniaoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50)
            
        ])
    }
}
