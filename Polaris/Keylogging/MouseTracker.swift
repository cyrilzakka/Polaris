//
//  MouseTracker.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI
import ApplicationServices

class MouseLocationManager: ObservableObject {
    @Published var mouseLocation: CGPoint = .zero
    private var eventTap: CFMachPort?
    private var runLoopSource: CFRunLoopSource?
    
    init() {
        setupEventTap()
    }
    
    private func setupEventTap() {
        // Create a callback as a block
        let callback: CGEventTapCallBack = { (proxy, type, event, refcon) -> Unmanaged<CGEvent>? in
            guard type == .mouseMoved else {
                return Unmanaged.passRetained(event)
            }
            let location = event.location
            if let refcon = refcon {
                let manager = Unmanaged<MouseLocationManager>.fromOpaque(refcon).takeUnretainedValue()
                DispatchQueue.main.async {
                    manager.mouseLocation = location
                }
            }
            
            return Unmanaged.passRetained(event)
        }
        
        // Create event tap
        let eventMask = CGEventMask(1 << CGEventType.mouseMoved.rawValue)
        guard let eventTap = CGEvent.tapCreate(
            tap: .cghidEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: eventMask,
            callback: callback,
            userInfo: UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        ) else {
            return
        }
        
        // Create and add run loop source
        self.eventTap = eventTap
        self.runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        
        if let runLoopSource = self.runLoopSource {
            CFRunLoopAddSource(CFRunLoopGetMain(), runLoopSource, .commonModes)
            CGEvent.tapEnable(tap: eventTap, enable: true)
        }
    }
    
    deinit {
        if let runLoopSource = runLoopSource {
            CFRunLoopRemoveSource(CFRunLoopGetMain(), runLoopSource, .commonModes)
        }
        
        if let eventTap = eventTap {
            CGEvent.tapEnable(tap: eventTap, enable: false)
        }
    }
}
