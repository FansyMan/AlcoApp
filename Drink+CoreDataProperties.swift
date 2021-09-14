//
//  Drink+CoreDataProperties.swift
//  AlcoApp
//
//  Created by Surgeont on 19.08.2021.
//
//

import Foundation
import CoreData


extension Drink {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drink> {
        return NSFetchRequest<Drink>(entityName: "Drink")
    }

    @NSManaged public var cathegory: String?
    @NSManaged public var descrip: String?
    @NSManaged public var drinkId: String?
    @NSManaged public var name: String?
    @NSManaged public var rate: String?
    @NSManaged public var shop: String?

}

extension Drink : Identifiable {

}
