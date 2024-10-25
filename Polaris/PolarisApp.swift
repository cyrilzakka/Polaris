//
//  PolarisApp.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI

@main
struct PolarisApp: App {
    
    @StateObject var screenRecorder = ScreenRecorder()
    
    var body: some Scene {
//        WindowGroup{
//            ContentView()
//                .environmentObject(screenRecorder)
//        }
        MenuBarExtra("Polaris", systemImage: "macwindow.and.cursorarrow") {
            AppMenu()
                .environmentObject(screenRecorder)
        }
       
        Settings {
            SettingsView()
                .environmentObject(screenRecorder)
        }
        .windowResizability(.contentSize)
        .restorationBehavior(.disabled)

    }
}
