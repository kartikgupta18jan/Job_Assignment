//
//  Reminder+CoreDataProperties.swift
//  Assignment
//
//  Created by Mahima Gupta on 11/28/21.
//


import Foundation
import CoreData


extension Reminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var done: Bool
    @NSManaged public var dueDate: NSDate?
    @NSManaged public var geofenceOption: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}
