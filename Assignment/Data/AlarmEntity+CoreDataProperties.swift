//
//  AlarmEntity+CoreDataProperties.swift
//  Assignment
//
//  Created by Mahima Gupta on 11/28/21.
//
//

import Foundation
import CoreData


extension AlarmEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlarmEntity> {
        return NSFetchRequest<AlarmEntity>(entityName: "AlarmEntity")
    }

    @NSManaged public var alarmEnabled: Bool
    @NSManaged public var alarmName: String?
    @NSManaged public var repeatOnFriday: Bool
    @NSManaged public var repeatOnMonday: Bool
    @NSManaged public var repeatOnSaturday: Bool
    @NSManaged public var repeatOnSunday: Bool
    @NSManaged public var repeatOnThursday: Bool
    @NSManaged public var repeatOnTuesday: Bool
    @NSManaged public var repeatOnWednesday: Bool
    @NSManaged public var snoozeDuration: Double
    @NSManaged public var snoozeEnabled: Bool
    @NSManaged public var soundIndex: Int32
    @NSManaged public var soundName: String?
    @NSManaged public var timeHour24: Int16
    @NSManaged public var timeMinute: Int16

}

extension AlarmEntity : Identifiable {

}
