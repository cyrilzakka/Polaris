//
//  KeylogManager.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI
import os

struct KeylogManager {
    
    let logger = Logger(subsystem: "com.cyrilzakka.Polaris.Keylogger", category: "Keylogger")
    
    static let shared = Keylogger()
    
    init () { }
    
    func start() {
        logger.info("Starting Keylogger")
        KeylogManager.shared.start()
    }
    
    func stop() {
        logger.info("Stopped keylogger")
        KeylogManager.shared.stop()
    }
}
