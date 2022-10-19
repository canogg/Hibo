//
//  FirstViewModel.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import Foundation
import UIKit

struct FirstViewModel {
    
    // Model
    private var choices: [CustomData] = [
        CustomData(title: "English", image: UIImage(named: "catenglish")!, buttonColor: UIColor(red: 49/255.0, green: 51/255.0, blue: 129/255.0, alpha: 1.0)),
        CustomData(title: "French", image: UIImage(named: "catfrench")!, buttonColor: UIColor(red: 190/255.0, green: 30/255.0, blue: 45/255.0, alpha: 1.0)),
        
    ]

    // Metodo que a Controller vai poder acessar
    func getChoicesCount() -> Int {
        return self.choices.count
    }

    func getChoice(for indexPath: IndexPath) -> CustomData {
        return self.choices[indexPath.row]
    }

}
