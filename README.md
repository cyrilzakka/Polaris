<p align="center" style="margin-bottom: 0;">
  <img src="assets/banner.png" alt="Polaris Banner">
</p>
<h1 align="center" style="margin-top: 0;">Polaris</h1>

![Static Badge](https://img.shields.io/badge/License-Apache-orange)
[![swift-version](https://img.shields.io/badge/Swift-6.0-brightgreen.svg)](https://github.com/apple/swift)
[![platform](https://img.shields.io/badge/Platform-macOS_15.0-blue.svg)](https://github.com/apple/swift)


### About
Polaris is a powerful, open-source data collection framework designed specifically for macOS to facilitate the training and deployment of AI agents. Polaris enables screen capture, keystroke logging, and mouse tracking, while maintaining user privacy and system performance.

### Features
- Key logging using low-level HID APIs to circumvent potential deprecation.
- Screen capture built on the [ScreenCaptureKit framework ](https://developer.apple.com/documentation/screencapturekit/)
- Mouse tracking using `NSEvent.mouseLocation`
- All features use official macOS APIs and require explicit user permission before data collection

### Data Collection
Click "Start Capture" in the menu bar to begin collecting data. Keyboard inputs, mouse movements, and screen recordings are saved to your specified destination folder with the following structure:
```
destination_folder/
├── recorded_output_2024-10-25_20-23-37.mp4  # Screen recording
├── recorded_output_2024-10-25_20-23-37.txt   # Mouse and keyboard events
├── recorded_output_2024-10-25_20-25-42.mp4
└── recorded_output_2024-10-25_20-25-42.txt
```

### Development Setup
#### Prerequisites
- Xcode 16.0 or later
- macOS 15.0 or later

#### Building the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/cyrilzakka/Polaris.git
   cd Polaris
   ```
2. Open `Polaris.xcodeproj` in Xcode
3. Select your development team in the project settings
4. Build and run the project (⌘ + R)

### Liability
This software is provided "as is", without warranty of any kind. By using Polaris, you accept full responsibility for the data collected and how it is used. Always obtain proper consent before collecting any data and comply with all applicable privacy laws and regulations.