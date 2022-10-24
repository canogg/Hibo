//
//  CustomData.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 17/10/22.
//

import Foundation
import UIKit

struct CustomDataIdioma {
    var title: String
    var image: UIImage
    var buttonColor: UIColor

    init(title: String, image: UIImage, buttonColor: UIColor) {
        self.title = title
        self.image = image
        self.buttonColor = buttonColor
    }
}
