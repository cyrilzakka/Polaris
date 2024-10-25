//
//  GeneralSettings.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI

struct GeneralSettings: View {
    
    @EnvironmentObject var screenRecorder: ScreenRecorder
    
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
            Section("Audio") {
                Toggle("Capture audio", isOn: $screenRecorder.isAudioCaptureEnabled)
                Toggle("Capture microphone output", isOn: $screenRecorder.isMicCaptureEnabled)
                
            }
            Section (content: {
                VStack {
                    Picker("Save Directory:", selection: $outputPathSelection) {
                        Text("Default").tag(OutputPathType.default)
                        Text("Custom").tag(OutputPathType.custom)
                    }
                    if outputPathSelection == .custom {
                        Divider()
                        HStack(alignment: .center) {
                            Text(outputPath)
                                .lineLimit(1)
                                .foregroundStyle(.secondary)
                                
                            HStack(alignment: .center) {
                                Button("Reset") {
                                    outputPathSelection = .default
                                    outputPath = defaultPath
                                }
                                .disabled(outputPath == defaultPath)
                                Button("Choose...") {
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                    }
                }
                
            }, header: {
                Text("Output")
            }, footer: {
                Button {
                    screenRecorder.openRecordingFolder()
                } label: {
                    Text("By default, recordings and associated metadata are saved in the application's home directory.") + Text(" 􀁽")
                }
                .buttonStyle(.plain)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .foregroundColor(.secondary)
            })
        }
        .formStyle(.grouped)
        .onAppear {
            if let placeholder = screenRecorder.recordingOutputPath {
                defaultPath = placeholder
                outputPath = placeholder
            }
        }
    }
}
