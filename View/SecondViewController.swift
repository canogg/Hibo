//
//  SecondViewController.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import UIKit

class SecondViewController: UIViewController {

    lazy var screen: SecondView = SecondView(frame: UIScreen.main.bounds)

    let viewModel: SecondViewModel = SecondViewModel()
    let viewModelPicker: PickerViewModel = PickerViewModel()

    override func loadView() {
        super.loadView()

        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen.collectionView.delegate = self
        self.screen.collectionView.dataSource = self

        self.screen.pickerSemana.delegate = self
        self.screen.pickerSemana.dataSource = self

        self.screen.didTapNextPage = {
            self.gpNextPage()
        }
    }

    private func gpNextPage() {
  //      let secondViewController = ThirdViewController()
        self.navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
}

extension SecondViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath) as? CustomCellSecond else {
            return UICollectionViewCell()
        }

        cell.layer.cornerRadius = 25
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.clipsToBounds = true

        let model = viewModel.getChoice(for: indexPath)
        cell.config(model: model)

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/2.3, height: collectionView.frame.width/4)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getChoicesCount()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(" selected")
    }
}

extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModelPicker.pickerSemana.count
    }

    func pickerView(_ picker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModelPicker.pickerSemana[row]
    }
}
