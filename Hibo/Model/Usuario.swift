//
//  Usuario.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import Foundation

class UserModel {
    internal init(id: UUID, name: String, nivel: Int, horario: Date) {
        self.id = id
        self.name = name
        self.nivel = nivel
        self.horario = horario
    }

    var id: UUID
    var name: String
    var nivel: Int
    var horario: Date

}
