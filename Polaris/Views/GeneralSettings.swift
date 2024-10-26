//
//  GeneralSettings.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI
import ScreenCaptureKit

struct GeneralSettings: View {
    
    @EnvironmentObject var screenRecorder: ScreenRecorder
    
    // Key logging
    @AppStorage("enableKeyLogger") private var enableKeyLogging = false
    @AppStorage("enableMouseTracking") private var enableMouseTracking = false
    
    // Output Path
    @State private var defaultPath: String = ""
    @State private var outputPath: String = ""
    @State private var outputPathSelection: OutputPathType = .default
    enum OutputPathType {
        case `default`
        case custom
    }
    
    var body: some View {
        Form {
            Section("Display") {
                Picker("Selected Display", selection: $screenRecorder.selectedDisplay) {
                    ForEach(screenRecorder.availableDisplays, id: \.self) { display in
                        Text(display.displayName)
                            .tag(SCDisplay?.some(display))
                    }
                }
                
                Picker("Display HDR", selection: $screenRecorder.selectedDynamicRangePreset) {
                    Text("Default (None)")
                        .tag(ScreenRecorder.DynamicRangePreset?.none)
                    ForEach(ScreenRecorder.DynamicRangePreset.allCases, id: \.self) {
                        Text($0.rawValue)
                            .tag(ScreenRecorder.DynamicRangePreset?.some($0))
                    }
                }
            }
            Section("Audio") {
                Toggle("Capture audio", isOn: $screenRecorder.isAudioCaptureEnabled)
                Toggle("Capture microphone output", isOn: $screenRecorder.isMicCaptureEnabled)
            }
            
            Section (content: {
                Toggle("Enable key logging", isOn: $enableKeyLogging)
                Toggle("Enable mouse tracking", isOn: $enableMouseTracking)
            }, header: {
                Text("Event Logging")
            }, footer: {
                Button {
                    screenRecorder.openRecordingFolder()
                } label: {
                    Text("When enabled, mouse and key events will be logged to a plain text file in the destination folder alongside the screen capture. While Polaris runs entirely locally, please be mindful of other applications that may try to access the same file.")
                }
                .buttonStyle(.plain)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .foregroundColor(.secondary)
            })
            //            Section (content: {
            //                VStack {
            //                    Picker("Save Directory:", selection: $outputPathSelection) {
            //                        Text("Default").tag(OutputPathType.default)
            //                        Text("Custom").tag(OutputPathType.custom)
            //                    }
            //                    if outputPathSelection == .custom {
            //                        Divider()
            //                        HStack(alignment: .center) {
            //                            Text(outputPath)
            //                                .lineLimit(1)
            //                                .foregroundStyle(.secondary)
            //
            //                            HStack(alignment: .center) {
            //                                Button("Reset") {
            //                                    outputPathSelection = .default
            //                                    outputPath = defaultPath
            //                                }
            //                                .disabled(outputPath == defaultPath)
            //                                Button("Choose...") {
            //
            //                                }
            //                            }
            //                            .frame(maxWidth: .infinity, alignment: .trailing)
            //                        }
            //
            //                    }
            //                }
            //
            //            }, header: {
            //                Text("Output")
            //            }, footer: {
            //                Button {
            //                    screenRecorder.openRecordingFolder()
            //                } label: {
            //                    Text("By default, recordings and associated metadata are saved in the application's home directory.") + Text(" 􀁽")
            //                }
            //                .buttonStyle(.plain)
            //                .font(.footnote)
            //                .frame(maxWidth: .infinity, alignment: .leading)
            //                .multilineTextAlignment(.leading)
            //                .lineLimit(nil)
            //                .foregroundColor(.secondary)
            //            })
        }
        .formStyle(.grouped)
        .task {
            await screenRecorder.monitorAvailableContent()
        }
        .onAppear {
            if let placeholder = screenRecorder.recordingOutputPath {
                defaultPath = placeholder
                outputPath = placeholder
            }
        }
    }
}
