//
//  FirstViewController.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import UIKit

class IdiomasViewController: UIViewController {
    lazy var screen: IdiomasView = IdiomasView(frame: UIScreen.main.bounds)
    let viewModel: IdiomasViewModel = IdiomasViewModel()
    override func loadView() {
        super.loadView()
        self.view = self.screen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen.collectionView.delegate = self
        self.screen.collectionView.dataSource = self
    }
    private func gpNextPage(title: String) {
        self.navigationController?.pushViewController(ChoicesFrenchViewController(), animated: true)
    }
}

extension IdiomasViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell",
                for: indexPath) as? CustomCellIdioma else {
                return UICollectionViewCell()
            }
            cell.layer.cornerRadius = 25
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.clipsToBounds = true
            let model = viewModel.getChoice(for: indexPath)
            cell.config(model: model)
            cell.didTapNextPage = {
                let model = self.viewModel.getChoice(for: indexPath)
                self.gpNextPage(title: model.title)
            }
            return cell
        }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/2.3, height: collectionView.frame.width/1.5)
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getChoicesCount()
    }
}
