//
//  SecondViewModel.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 18/10/22.
//

import Foundation
import UIKit

struct SecondViewModel {

    // Model
    private var choices: [CustomDataSecond] = [
        CustomDataSecond(title: "English", image: UIImage(named: "level1")!),
        CustomDataSecond(title: "French", image: UIImage(named: "level2")!),
        CustomDataSecond(title: "English", image: UIImage(named: "level3")!),
        CustomDataSecond(title: "French", image: UIImage(named: "level4")!),
        CustomDataSecond(title: "English", image: UIImage(named: "level5")!),
        CustomDataSecond(title: "French", image: UIImage(named: "level6")!),

    ]

    // Metodo que a Controller vai poder acessar
    func getChoicesCount() -> Int {
        return self.choices.count
    }

    func getChoice(for indexPath: IndexPath) -> CustomDataSecond {
        return self.choices[indexPath.row]
    }

}
