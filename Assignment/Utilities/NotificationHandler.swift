//
//  NotificationHandler.swift
//  Assignment
//
//  Created by Mahima Gupta on 11/28/21.
//

import Foundation
import UserNotifications
import CoreLocation
import CoreData
import UIKit

class NotificationHandler {
    
    private static let notificationCenter = UNUserNotificationCenter.current()
    
    static func setupNotifications(){
        
        notificationCenter.removeAllDeliveredNotifications()
        notificationCenter.removeAllPendingNotificationRequests()
        
        let reminders = DataHandler.allReminders()
        for reminder in reminders {
            if (reminder.done == false) {
                addNotificationFromReminder(reminder)
            }
        }
    }
    
    
    static func requestNotificationAuthorization(){
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
    }
    
    static func addNotificationFromReminder(_ reminder: Reminder){
        
        let content = UNMutableNotificationContent()
        
        content.title = reminder.title!
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        if let dueDate = reminder.dueDate {
            addScheduledNotification(identifier: reminder.id!.uuidString, date: dueDate as Date, content: content)
        }

    }
    
    static func removeReminderNotification(reminder: Reminder){
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [(reminder.id?.uuidString)!])
        notificationCenter.removeDeliveredNotifications(withIdentifiers: [(reminder.id?.uuidString)!])
    }
    
    private static func addScheduledNotification(identifier: String, date: Date, content: UNMutableNotificationContent){
        
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    private static func addGeofenceNotification(identifier: String, region: CLRegion, content: UNMutableNotificationContent){
        
        let trigger = UNLocationNotificationTrigger(region:region, repeats:true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
}
