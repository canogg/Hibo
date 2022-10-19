//
//  SecondView.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import UIKit

class SecondView: UIView {

    var didTapNextPage: (() -> Void)?

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Qual seu nome?"
        return label
    }()

    lazy var nameTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = UIColor.white
        txt.autocorrectionType = .no
        txt.borderStyle = .roundedRect
        txt.keyboardType = .alphabet
        txt.attributedPlaceholder = NSAttributedString(
            string: "Digite seu nome",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.4)]

        )
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 9
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.gray.cgColor

        return txt
    }()

    lazy var nameIdioma: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Qual seu nível no idioma?"
        return label
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCellSecond.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    lazy var diaDaSemanaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Qual seu dia da semana disponível?"
        return label
    }()

    var pickerSemana: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    lazy var horarioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Qual seu horário disponível?"
        return label
    }()

    var pickerHorario: UIDatePicker = {
        let picker = UIDatePicker()
        picker.timeZone = NSTimeZone.local
        picker.translatesAutoresizingMaskIntoConstraints = false

        return picker
    }()

    let buttonMatch: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Match!", for: .normal)
        button.backgroundColor = UIColor(red: 190/255.0, green: 30/255.0, blue: 45/255.0, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(nextpagematch), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    @objc func nextpagematch(sender: UIButton) {
        didTapNextPage?()
    }

    @objc func buttonAction(sender: UIButton!) {
        UserDefaults.standard.setPersonName(value: nameTextField.text!)
    }

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        self.addSubview(nameIdioma)
        self.addSubview(collectionView)
        self.addSubview(diaDaSemanaLabel)
        self.addSubview(pickerSemana)
        //        self.addSubview(pickerSemanaLabel)
        self.addSubview(horarioLabel)
        self.addSubview(pickerHorario)
        self.addSubview(buttonMatch)
        //        self.addSubview(enviarButton)
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([

            self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),

            self.nameTextField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),

            //            self.enviarButton.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20),
            //            self.enviarButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),

            self.nameIdioma.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 20),
            self.nameIdioma.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.nameIdioma.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),

            self.collectionView.topAnchor.constraint(equalTo: self.nameIdioma.bottomAnchor, constant: 20),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.collectionView.heightAnchor.constraint(equalToConstant: 300),

            self.diaDaSemanaLabel.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 20),
            self.diaDaSemanaLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.diaDaSemanaLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),

            self.pickerSemana.topAnchor.constraint(equalTo: self.diaDaSemanaLabel.bottomAnchor, constant: -70),
            self.pickerSemana.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.pickerSemana.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),

            self.horarioLabel.topAnchor.constraint(equalTo: self.diaDaSemanaLabel.bottomAnchor, constant: 70),
            self.horarioLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.horarioLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),

            self.pickerHorario.topAnchor.constraint(equalTo: self.pickerSemana.bottomAnchor, constant: -20),
            self.pickerHorario.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.pickerHorario.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            self.buttonMatch.topAnchor.constraint(equalTo: self.pickerHorario.bottomAnchor, constant: 30),
            self.buttonMatch.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.buttonMatch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -95)
        ])
    }
}
