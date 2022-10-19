//
//  PickerViewController.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 18/10/22.
//

import Foundation
import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    lazy var screen: SecondView = SecondView(frame: UIScreen.main.bounds)

    let viewModel: PickerViewModel = PickerViewModel()

    func numberOfComponents(in picker: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ picker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.pickerSemana.count
    }

    func pickerView(_ picker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.pickerSemana[row]
    }

    override func viewDidLoad() {
      super.viewDidLoad()

      view.backgroundColor = .white

        self.screen.pickerSemana.delegate = self
        self.screen.pickerSemana.dataSource = self

   }
}
