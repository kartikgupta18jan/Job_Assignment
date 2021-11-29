//
//  DeviceService.swift
//  Assignment
//
//  Created by Mahima Gupta on 11/28/21.
//
import UIKit

class DeviceService{
    static let instance = DeviceService()
    private init(){
        NotificationCenter.default.addObserver(self, selector: #selector(onBatteryStateChanged(_:)), name: UIDevice.batteryStateDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onSettingsChanged(_:)), name: UserDefaults.didChangeNotification, object: nil)
    }

    @objc 
    private func onBatteryStateChanged(_ notification: Notification) {
        self.determineAutolockState()
    }

    @objc
    private func onSettingsChanged(_ notification: Notification){
        self.determineAutolockState()
    }
    
    
    var batteryPercentage: Int{
        get{
            return Int(UIDevice.current.batteryLevel * 100.0)
        }
    }
    
    
    func determineAutolockState(){
        let isDevicePluggedIn = UIDevice.current.batteryState == .full || UIDevice.current.batteryState == .charging
        
        if isDevicePluggedIn{
            UIApplication.shared.isIdleTimerDisabled = true
        }else { // Always enable autolock when unplugged
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
    
}
