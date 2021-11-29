//
//  AlarmUtility.swift
//  Assignment
//
//  Created by Mahima Gupta on 11/28/21.
//

import Foundation
import CoreData

enum AlarmUtility{
    public enum Weekday: Int{
        case sunday = 1
        case monday = 2
        case tuesday = 3
        case wednesday = 4
        case thursday = 5
        case friday = 6
        case saturday = 7
    }
    
    
    static func doesAlarmRepeat(_ alarm: AlarmEntity, on weekday: Weekday) -> Bool{
        var doesRepeat = false
        
        switch weekday{
        case .sunday:
            doesRepeat = alarm.repeatOnSunday
            break
        case .monday:
            doesRepeat = alarm.repeatOnMonday
            break
        case .tuesday:
            doesRepeat = alarm.repeatOnTuesday
            break
        case .wednesday:
            doesRepeat = alarm.repeatOnWednesday
            break
        case .thursday:
            doesRepeat = alarm.repeatOnThursday
            break
        case .friday:
            doesRepeat = alarm.repeatOnFriday
            break
        case .saturday:
            doesRepeat = alarm.repeatOnSaturday
            break
        }
        
        return doesRepeat
    }
    
    
    static func doesAlarmRepeatEveryday(_ alarm: AlarmEntity) -> Bool{
        if alarm.repeatOnSunday{
            if alarm.repeatOnMonday{
                if alarm.repeatOnTuesday{
                    if alarm.repeatOnWednesday{
                        if alarm.repeatOnThursday{
                            if alarm.repeatOnFriday{
                                if alarm.repeatOnSaturday{
                                    return true
                                }
                            }
                        }
                    }
                }
            }
        }
        return false
    }
    
    static func doesAlarmRepeatNoDays(_ alarm: AlarmEntity) -> Bool {
        if !alarm.repeatOnSunday{
            if !alarm.repeatOnMonday{
                if !alarm.repeatOnTuesday{
                    if !alarm.repeatOnWednesday{
                        if !alarm.repeatOnThursday{
                            if !alarm.repeatOnFriday{
                                if !alarm.repeatOnSaturday{
                                    return true
                                }
                            }
                        }
                    }
                }
            }
        }
        return false
    }
}

