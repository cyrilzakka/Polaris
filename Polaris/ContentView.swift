//
//  ContentView.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI
import Combine


struct ContentView: View {
    @StateObject private var mouseManager = MouseLocationManager()
        
        var body: some View {
            VStack(spacing: 20) {
                Text("Global Mouse Position:")
                Text(String(format: "X: %.1f, Y: %.1f",
                           mouseManager.mouseLocation.x,
                           mouseManager.mouseLocation.y))
            }
            .padding()
            .frame(width: 300, height: 200)
        }
}

#Preview {
    ContentView()
}
