//
//  SecondViewController.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import UIKit

class ChoicesFrenchViewController: UIViewController {
    lazy var screen: ChoichesFrenchView = ChoichesFrenchView(frame: UIScreen.main.bounds)
    let viewModel: ChoicesViewModel = ChoicesViewModel()
    let viewModelPicker: PickerViewModel = PickerViewModel()

    var nivel: Int = 0

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
        self.navigationController?.pushViewController(MatchViewController(), animated: true)
    }
}

extension ChoicesFrenchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell",
                for: indexPath) as? CustomCellLevel else {
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
            return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.width/4.5)
        }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getChoicesCount()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
        switch indexPath.row{
        case 0:
            nivel = indexPath.row
            print(nivel)
        case 1:
            nivel = indexPath.row
        case 2:
            nivel = indexPath.row
        case 3:
            nivel = indexPath.row
        case 4:
            nivel = indexPath.row
        case 5:
            nivel = indexPath.row
        default:
            break
        }
    }
}

extension ChoicesFrenchViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
