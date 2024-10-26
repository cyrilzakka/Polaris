//
//  MouseTracker.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI
import Combine

class MouseLocationManager: ObservableObject {
    @Published var mouseLocation: CGPoint = .zero
    @Published var windowLocation: CGPoint = .zero
    
    private var localMonitor: Any?
    private var globalMonitor: Any?
    private var window: NSWindow? {
        NSApplication.shared.windows.first
    }
    
    init() {
        setupMonitors()
    }
    
    func setupMonitors() {
        // Setup local monitor (within app windows)
        localMonitor = NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) { [weak self] event in
            self?.updateLocations()
            return event
        }
        
        // Setup global monitor (entire screen)
        globalMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved]) { [weak self] _ in
            self?.updateLocations()
        }
        
        // Enable mouse moved events for the window
        window?.acceptsMouseMovedEvents = true
    }
    
    private func updateLocations() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            // Update global mouse location
            self.mouseLocation = NSEvent.mouseLocation
            
            // Update window-relative location if window exists
            if let window = self.window {
                self.windowLocation = window.mouseLocationOutsideOfEventStream
            }
        }
    }
    
    deinit {
        if let localMonitor = localMonitor {
            NSEvent.removeMonitor(localMonitor)
        }
        if let globalMonitor = globalMonitor {
            NSEvent.removeMonitor(globalMonitor)
        }
    }
}
