//
//  AppMenu.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI

struct AppMenu: View {
    
    @AppStorage("enableMouseTracking") private var enableMouseTracking = false
    @AppStorage("enableKeyLogger") private var enableKeyLogger = false
    @Environment(\.openSettings) private var openSettings
    @EnvironmentObject var screenRecorder: ScreenRecorder
    
    @State var isUnauthorized = false
    @State var showPickerSettingsView = false
    
    var body: some View {
        Button(action: {
            screenRecorder.isRecordingStream.toggle()
        }, label: { Text(screenRecorder.isRecordingStream ? "Stop Recording" : "Start Recording") })
        .keyboardShortcut("c", modifiers: [.shift, .command])
        .disabled(!screenRecorder.isRunning || isUnauthorized)
        .onChange(of: screenRecorder.isRecordingStream) {
            if enableKeyLogger {
                if screenRecorder.isRecordingStream { KeylogManager.shared.start() }
                else { KeylogManager.shared.stop() }
            }
        }
        
        Button(action: {
            screenRecorder.isPickerActive = true
            screenRecorder.presentPicker()
        }, label: { Text("Select Capture Area...") })
        .keyboardShortcut("w", modifiers: [.shift, .command])
        .onChange(of: screenRecorder.pickerUpdate) {
            if !screenRecorder.isRunning {
                Task { await screenRecorder.start() }
            }
        }
        
        Divider()
        
        Button(action: {
            screenRecorder.openRecordingFolder()
        }, label: { Text("View Recordings") })
        .keyboardShortcut("o", modifiers: [.shift, .command])
        
        Divider()
        Button(action: {
            openSettings()
        }, label: { Text("Settings...") })
        .keyboardShortcut(",")
        Divider()
        Button(action: {
            NSApplication.shared.terminate(nil)
        }, label: { Text("Quit Polaris") })
        .keyboardShortcut("q")
        
        .onAppear {
            Task {
                if await !screenRecorder.canRecord {
                    isUnauthorized = true
                } else {
                    if !screenRecorder.isRunning {
                        await screenRecorder.start()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    AppMenu()
}
