//
//  RingingAlarmLaunchable.swift
//  Assignment
//
//  Created by Mahima Gupta on 11/28/21.
//

import UIKit
import CoreData

// Anyone adapting this protocol must be able to launch an alarm
protocol RingingAlarmLaunchable: class{
    func launchAlarm(_ alarm: AlarmEntity)
}

protocol SetAlarmDone: class{
    func alarmDataPass()
}

// Implementation of RingingAlarmLaunchable specific to view controllers
extension RingingAlarmLaunchable where Self: UIViewController{
    func launchAlarm(_ alarm: AlarmEntity){
        guard let ringingAlarmVC = storyboard?.instantiateViewController(withIdentifier: RingingAlarmViewController.STRYBRD_ID) as? RingingAlarmViewController else {return}
        
        ringingAlarmVC.setup(withAlarm: alarm)
        
        present(ringingAlarmVC, animated: true, completion: nil)
    }
}

