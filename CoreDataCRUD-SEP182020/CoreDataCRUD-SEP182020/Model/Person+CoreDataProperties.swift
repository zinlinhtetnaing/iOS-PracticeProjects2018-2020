//
//  Person+CoreDataProperties.swift
//  CoreDataCRUD-SEP182020
//
//  Created by Zin Lin Htet Naing on 19/09/2020.
//  Copyright © 2020 Zin Lin Htet Naing. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int64
    @NSManaged public var gender: String?
    @NSManaged public var id: Int16
    @NSManaged public var name: String?

}
