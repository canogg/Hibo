//
//  FirstViewController.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import UIKit

class FirstViewController: UIViewController {

    lazy var screen: FirstView = FirstView(frame: UIScreen.main.bounds)

    let viewModel: FirstViewModel = FirstViewModel()

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
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}

extension FirstViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath) as? CustomCell else {
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
