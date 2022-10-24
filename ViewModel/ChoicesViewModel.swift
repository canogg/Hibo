//
//  SecondViewModel.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 18/10/22.
//

import Foundation
import UIKit

struct ChoicesViewModel {

    // Model
    private var choices: [CustomDataLevel] = [
        CustomDataLevel(title: "English", image: UIImage(named: "level1")!),
        CustomDataLevel(title: "French", image: UIImage(named: "level2")!),
        CustomDataLevel(title: "English", image: UIImage(named: "level3")!),
        CustomDataLevel(title: "French", image: UIImage(named: "level4")!),
        CustomDataLevel(title: "English", image: UIImage(named: "level5")!),
        CustomDataLevel(title: "French", image: UIImage(named: "level6")!)

    ]

    // Metodo que a Controller vai poder acessar
    func getChoicesCount() -> Int {
        return self.choices.count
    }

    func getChoice(for indexPath: IndexPath) -> CustomDataLevel {
        return self.choices[indexPath.row]
    }

}
