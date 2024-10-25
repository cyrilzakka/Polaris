//
//  SettingsView.swift
//  Polaris
//
//  Created by Cyril Zakka on 10/25/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            Tab("General", systemImage: "gear") {
                GeneralSettings()
            }
        }
//        .scenePadding()
        .frame(maxWidth: 450, maxHeight: .infinity)
    }
}

#Preview {
    SettingsView()
}
