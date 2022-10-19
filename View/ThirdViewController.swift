//
//  ThirdViewController.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import UIKit

class ThirdViewController: UIViewController {
    lazy var screen: ThirdView = ThirdView(frame: UIScreen.main.bounds)
    let viewModel: SecondViewModel = SecondViewModel()

    // custom init uiviewcontroller

    override func loadView() {
        super.loadView()
        self.view = self.screen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.didTapNextPage = { [weak self] in
            self?.gpNextPage(title: "Teu titulo aqui")
        }
    }
    private func gpNextPage(title: String) {
        let thirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
}
