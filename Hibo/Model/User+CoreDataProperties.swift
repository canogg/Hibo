//
//  User+CoreDataProperties.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 21/10/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var nome: String
    @NSManaged public var nivel: Int16
    @NSManaged public var diaDaSemana: String
    @NSManaged public var data: Date

}

extension User : Identifiable {

}
