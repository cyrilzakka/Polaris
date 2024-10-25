//
//  ContentView.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var screenRecorder: ScreenRecorder
    @State var isRecordingActive: Bool = false
    
    var body: some View {
        HSplitView {
            List {
                Toggle("Exclude sample app from stream", isOn: $screenRecorder.isAppExcluded)
                    .disabled(screenRecorder.captureType == .window)
                    
                HStack {
                    Toggle("Add screen recording output", isOn: $screenRecorder.isRecordingStream)
                    // Simple screen recording indicator
                    VStack {
                        if screenRecorder.isRecordingStream {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .scaledToFit()
                                .brightness(isRecordingActive ? 0.1: 0.0)
                                .foregroundColor(.red)
                                .onAppear() {
                                    withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                        isRecordingActive = true
                                    }
                                }
                        }
                    }
                    .frame(width: 10, height: 10)
                }
                Button("View Recordings", systemImage: "folder.fill", action: screenRecorder.openRecordingFolder)
            }
            screenRecorder.capturePreview
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(screenRecorder.contentSize, contentMode: .fit)
                .padding(8)
        }
    }
}

#Preview {
    ContentView()
}
