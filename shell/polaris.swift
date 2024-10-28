import Foundation
import AppKit
import ScreenCaptureKit
import CoreGraphics
import CoreMedia
import CoreImage
import UniformTypeIdentifiers

/// Keycode for keyboard input
///
/// Example
/// ```swift
/// // Send ctrl + ←
/// import PolarisGUI
/// PolarisGUI.sendKeyShortcut([.control, .leftArrow])
///
/// // Send sound up
/// PolarisGUI.keyDown(.soundUp)
/// PolarisGUI.keyUp(.soundUp)
/// ```
public enum Key {

    // normal keycode
    case returnKey
    case enter
    case tab
    case space
    case delete
    case escape
    case command
    case shift
    case capsLock
    case option
    case control
    case rightShift
    case rightOption
    case rightControl
    case leftArrow
    case rightArrow
    case downArrow
    case upArrow
    case volumeUp
    case volumeDown
    case mute
    case help
    case home
    case pageUp
    case forwardDelete
    case end
    case pageDown
    case function
    case f1
    case f2
    case f4
    case f5
    case f6
    case f7
    case f3
    case f8
    case f9
    case f10
    case f11
    case f12
    case f13
    case f14
    case f15
    case f16
    case f17
    case f18
    case f19
    case f20

    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case i
    case j
    case k
    case l
    case m
    case n
    case o
    case p
    case q
    case r
    case s
    case t
    case u
    case v
    case w
    case x
    case y
    case z

    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine

    case equals
    case minus
    case semicolon
    case apostrophe
    case comma
    case period
    case forwardSlash
    case backslash
    case grave
    case leftBracket
    case rightBracket

    case keypadDecimal
    case keypadMultiply
    case keypadPlus
    case keypadClear
    case keypadDivide
    case keypadEnter
    case keypadMinus
    case keypadEquals
    case keypad0
    case keypad1
    case keypad2
    case keypad3
    case keypad4
    case keypad5
    case keypad6
    case keypad7
    case keypad8
    case keypad9

    // special keycode
    // TODO: add other code
    case soundUp
    case soundDown
    case brightnessUp
    case brightnessDown
    case numLock


    /// Normal keycode of the key.
    public var normalKeycode: CGKeyCode? {
        switch self {
        case .returnKey      : return 0x24
        case .enter          : return 0x4C
        case .tab            : return 0x30
        case .space          : return 0x31
        case .delete         : return 0x33
        case .escape         : return 0x35
        case .command        : return 0x37
        case .shift          : return 0x38
        case .capsLock       : return 0x39
        case .option         : return 0x3A
        case .control        : return 0x3B
        case .rightShift     : return 0x3C
        case .rightOption    : return 0x3D
        case .rightControl   : return 0x3E
        case .leftArrow      : return 0x7B
        case .rightArrow     : return 0x7C
        case .downArrow      : return 0x7D
        case .upArrow        : return 0x7E
        case .volumeUp       : return 0x48
        case .volumeDown     : return 0x49
        case .mute           : return 0x4A
        case .help           : return 0x72
        case .home           : return 0x73
        case .pageUp         : return 0x74
        case .forwardDelete  : return 0x75
        case .end            : return 0x77
        case .pageDown       : return 0x79
        case .function       : return 0x3F
        case .f1             : return 0x7A
        case .f2             : return 0x78
        case .f4             : return 0x76
        case .f5             : return 0x60
        case .f6             : return 0x61
        case .f7             : return 0x62
        case .f3             : return 0x63
        case .f8             : return 0x64
        case .f9             : return 0x65
        case .f10            : return 0x6D
        case .f11            : return 0x67
        case .f12            : return 0x6F
        case .f13            : return 0x69
        case .f14            : return 0x6B
        case .f15            : return 0x71
        case .f16            : return 0x6A
        case .f17            : return 0x40
        case .f18            : return 0x4F
        case .f19            : return 0x50
        case .f20            : return 0x5A

        case .a              : return 0x00
        case .b              : return 0x0B
        case .c              : return 0x08
        case .d              : return 0x02
        case .e              : return 0x0E
        case .f              : return 0x03
        case .g              : return 0x05
        case .h              : return 0x04
        case .i              : return 0x22
        case .j              : return 0x26
        case .k              : return 0x28
        case .l              : return 0x25
        case .m              : return 0x2E
        case .n              : return 0x2D
        case .o              : return 0x1F
        case .p              : return 0x23
        case .q              : return 0x0C
        case .r              : return 0x0F
        case .s              : return 0x01
        case .t              : return 0x11
        case .u              : return 0x20
        case .v              : return 0x09
        case .w              : return 0x0D
        case .x              : return 0x07
        case .y              : return 0x10
        case .z              : return 0x06

        case .zero           : return 0x1D
        case .one            : return 0x12
        case .two            : return 0x13
        case .three          : return 0x14
        case .four           : return 0x15
        case .five           : return 0x17
        case .six            : return 0x16
        case .seven          : return 0x1A
        case .eight          : return 0x1C
        case .nine           : return 0x19

        case .equals         : return 0x18
        case .minus          : return 0x1B
        case .semicolon      : return 0x29
        case .apostrophe     : return 0x27
        case .comma          : return 0x2B
        case .period         : return 0x2F
        case .forwardSlash   : return 0x2C
        case .backslash      : return 0x2A
        case .grave          : return 0x32
        case .leftBracket    : return 0x21
        case .rightBracket   : return 0x1E

        case .keypadDecimal  : return 0x41
        case .keypadMultiply : return 0x43
        case .keypadPlus     : return 0x45
        case .keypadClear    : return 0x47
        case .keypadDivide   : return 0x4B
        case .keypadEnter    : return 0x4C
        case .keypadMinus    : return 0x4E
        case .keypadEquals   : return 0x51
        case .keypad0        : return 0x52
        case .keypad1        : return 0x53
        case .keypad2        : return 0x54
        case .keypad3        : return 0x55
        case .keypad4        : return 0x56
        case .keypad5        : return 0x57
        case .keypad6        : return 0x58
        case .keypad7        : return 0x59
        case .keypad8        : return 0x5B
        case .keypad9        : return 0x5C
        default              : return nil
        }
    }

    /// Special keycodes for media keys and other special keys
    public var specialKeycode: Int32? {
        switch self {
        case .soundUp        : return NX_KEYTYPE_SOUND_UP
        case .soundDown      : return NX_KEYTYPE_SOUND_DOWN
        case .brightnessUp   : return NX_KEYTYPE_BRIGHTNESS_UP
        case .brightnessDown : return NX_KEYTYPE_BRIGHTNESS_DOWN
        case .numLock        : return NX_KEYTYPE_NUM_LOCK
        default              : return nil
        }
    }
}

public class PolarisGUI: NSObject {

    // MARK: Key Event

    /// Send a key shortcut
    ///
    /// - Parameter keys: The keys to be pressed. The order of the keys is the order of pressing.
    /// For example, if you want to press `command + c`, you should call `sendKeyShortcut([.command, .c])`. The details of Key is in ``Key``
    ///
    /// Example
    /// ```swift
    /// // Send ctrl + ←
    /// import PolarisGUI
    /// PolarisGUI.sendKeyShortcut([.control, .leftArrow])
    ///
    /// // Send sound up
    /// PolarisGUI.keyDown(.soundUp)
    /// PolarisGUI.keyUp(.soundUp)
    /// ```

    private var stream: SCStream?
    private let semaphore = DispatchSemaphore(value: 0)
    private var latestImage: CGImage?


    @discardableResult
    public func takeScreenshot() async throws -> Bool {
        do {
            guard let display = try await SCShareableContent.current.displays.first else {
                print("No display found")
                return false
            }
            
            let filter = SCContentFilter(display: display, excludingApplications: [], exceptingWindows: [])
            let configuration = SCStreamConfiguration()
            
            // Set the configuration properties
            configuration.width = display.width * 2  // multiply by 2 for Retina displays
            configuration.height = display.height * 2
            configuration.minimumFrameInterval = CMTime(value: 1, timescale: 1)
            configuration.queueDepth = 1
            
            // Capture the screenshot
            let sample = try await SCScreenshotManager.captureImage(contentFilter: filter,
                                                                  configuration: configuration)
            
            // Setup save location
            let screenshotPath = FileManager.default.homeDirectoryForCurrentUser
                .appendingPathComponent("Desktop")
                .appendingPathComponent("Screenshots")
            
            try FileManager.default.createDirectory(at: screenshotPath,
                                                  withIntermediateDirectories: true)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd_HH-mm-ss"
            let timestamp = formatter.string(from: Date())
            let destination = screenshotPath.appendingPathComponent("screenshot_\(timestamp).png")
            
            // Save the file
            guard let cgDestination = CGImageDestinationCreateWithURL(destination as CFURL, UTType.png.identifier as CFString, 1, nil) else {
                print("Failed to create image destination")
                return false
            }
            
            CGImageDestinationAddImage(cgDestination, sample, nil)
            let success = CGImageDestinationFinalize(cgDestination)
            
            if success {
                print("Screenshot taken!")
            } else {
                print("Failed to save screenshot")
            }
            
            return success
            
        } catch {
            print("Screenshot failed with error: \(error)")
            return false
        }
    }
    
    private func saveScreenshot(_ image: CGImage) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        let filename = "screenshot-\(dateFormatter.string(from: Date())).png"
        
        let url = FileManager.default.currentDirectoryPath + "/" + filename
        let destination = CGImageDestinationCreateWithURL(
            URL(fileURLWithPath: url) as CFURL,
            UTType.png.identifier as CFString,
            1,
            nil
        )
        
        if let destination = destination {
            CGImageDestinationAddImage(destination, image, nil)
            CGImageDestinationFinalize(destination)
            print("Screenshot saved as: \(filename)")
        }
    }


    public static func sendKeyShortcut(_ keys: [Key]) {
        for key in keys {
            keyDown(key)
        }
        for key in keys.reversed() {
            keyUp(key)
        }
    }

    /// Press a key
    ///
    /// - Parameter key: The key to be pressed. The details of Key is in ``Key``
    public static func keyDown(_ key: Key) {
        if let normalKeycode = key.normalKeycode {
            normalKeyEvent(normalKeycode, down: true)
        } else if let specialKeycode = key.specialKeycode {
            specialKeyEvent(specialKeycode, down: true)
        }
    }

    /// Release a key
    ///
    /// - Parameter key: The key to be released.
    public static func keyUp(_ key: Key) {
        if let normalKeycode = key.normalKeycode {
            normalKeyEvent(normalKeycode, down: false)
        } else if let specialKeycode = key.specialKeycode {
            specialKeyEvent(specialKeycode, down: false)
        }
    }

    /// Press a key and release it
    ///
    /// - Parameter key: The key to be pressed and released. The details of Key is in  `normalKeycode` of ``Key``
    private static func normalKeyEvent(_ key: CGKeyCode, down: Bool) {
        let source = CGEventSource(stateID: .hidSystemState)
        let event = CGEvent(keyboardEventSource: source, virtualKey: key, keyDown: down)
        event?.post(tap: .cghidEventTap)
        Thread.sleep(forTimeInterval: 0.01)
    }

    /// Press a special key and release it
    ///
    /// - Parameter key: The key to be pressed and released. The details of Key is in  `specialKeycode` of ``Key``
    private static func specialKeyEvent(_ key: Int32, down: Bool) {
        let modifierFlags = NSEvent.ModifierFlags(rawValue: down ? 0xA00 : 0xB00)
        let nsEvent = NSEvent.otherEvent(
            with: .systemDefined,
            location: NSPoint(x: 0, y: 0),
            modifierFlags: modifierFlags,
            timestamp: 0,
            windowNumber: 0,
            context: nil,
            subtype: 8,
            data1: Int((key << 16)) | ((down ? 0xA : 0xB) << 8),
            data2: -1
        )
        let cgEvent = nsEvent?.cgEvent
        cgEvent?.post(tap: .cghidEventTap)
        Thread.sleep(forTimeInterval: 0.01)
    }

    // MARK: Mouse Event

    /// Move mouse by dx, dy from the current location
    ///
    /// - Parameters:
    ///     - dx: The distance to move in the x-axis
    ///     - dy: The distance to move in the y-axis
    public static func moveMouse(dx: CGFloat, dy: CGFloat) {
        var mouseLoc = NSEvent.mouseLocation
        mouseLoc.y = NSHeight(NSScreen.screens[0].frame) - mouseLoc.y;
        let newLoc = CGPoint(x: mouseLoc.x-CGFloat(dx), y: mouseLoc.y + CGFloat(dy))
        CGDisplayMoveCursorToPoint(0, newLoc)
        Thread.sleep(forTimeInterval: 0.01)
    }

    /// Move the mouse to a specific position
    /// - Parameter to: This parameter is the `CGWindow` coordinate.
    public static func move(to: CGPoint) {
        CGDisplayMoveCursorToPoint(0, to)
        Thread.sleep(forTimeInterval: 0.01)
    }

    /// Press the left mouse button at a current position
    public static func leftClick() {
        var mouseLoc = NSEvent.mouseLocation
        mouseLoc = CGPoint(x: mouseLoc.x, y: NSHeight(NSScreen.screens[0].frame) - mouseLoc.y)
        leftClickDown(position: mouseLoc)
        leftClickUp(position: mouseLoc)
    }

    /// Press the left mouse button at a current position
    public static func rightClick() {
        var mouseLoc = NSEvent.mouseLocation
        mouseLoc = CGPoint(x: mouseLoc.x, y: NSHeight(NSScreen.screens[0].frame) - mouseLoc.y)
        rightClickDown(position: mouseLoc)
        rightClickUp(position: mouseLoc)
    }

    /// Dragg the left mouse button from a position to another position
    ///
    /// - Parameters:
    ///    - to: The position to drag to
    ///    - from: The position to drag from
    public static func leftDragged(to: CGPoint, from: CGPoint) {
        leftClickDown(position: from)
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseDragged,
                            mouseCursorPosition: to, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
        leftClickUp(position: to)
    }

    /// Scroll the mouse wheel vertically
    ///
    /// - Parameter clicks: The number of clicks to scroll. Positive value means scroll up, negative value means scroll down.
    public static func vscroll(clicks: Int) {
        for _ in 0...Int(abs(clicks) / 10) {
            let scrollEvent = CGEvent(
                scrollWheelEvent2Source: nil,
                units: .line,
                wheelCount: 1,
                wheel1: clicks >= 0 ? 10 : -10,
                wheel2: 0,
                wheel3: 0
            )
            scrollEvent?.post(tap: .cghidEventTap)
        }

        let scrollEvent = CGEvent(
            scrollWheelEvent2Source: nil,
            units: .line,
            wheelCount: 1,
            wheel1: Int32(clicks >= 0 ? clicks % 10 : -1 * (-clicks % 10)),
            wheel2: 0,
            wheel3: 0
        )
        scrollEvent?.post(tap: .cghidEventTap)
    }

    /// Scroll the mouse wheel horizontally
    ///
    /// - Parameter clicks: The number of clicks to scroll. Positive value means scroll left, negative value means scroll right.
    public static func hscroll(clicks: Int) {
        for _ in 0...Int(abs(clicks) / 10) {
            let scrollEvent = CGEvent(
                scrollWheelEvent2Source: nil,
                units: .line,
                wheelCount: 2,
                wheel1: 0,
                wheel2: clicks >= 0 ? 10 : -10,
                wheel3: 0
            )
            scrollEvent?.post(tap: .cghidEventTap)
        }

        let scrollEvent = CGEvent(
            scrollWheelEvent2Source: nil,
            units: .line,
            wheelCount: 2,
            wheel1: 0,
            wheel2: Int32(clicks >= 0 ? clicks % 10 : -1 * (-clicks % 10)),
            wheel3: 0
        )
        scrollEvent?.post(tap: .cghidEventTap)
    }

    private static func leftClickDown(position: CGPoint) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseDown,
                            mouseCursorPosition: position, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }

    private static func leftClickUp(position: CGPoint) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseUp,
                            mouseCursorPosition: position, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }

    private static func rightClickDown(position: CGPoint) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.rightMouseDown,
                            mouseCursorPosition: position, mouseButton: CGMouseButton.right)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }

    private static func rightClickUp(position: CGPoint) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.rightMouseUp,
                            mouseCursorPosition: position, mouseButton: CGMouseButton.right)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }
}

extension PolarisGUI: SCStreamOutput {
    public func stream(_ stream: SCStream, didOutputSampleBuffer sampleBuffer: CMSampleBuffer, of type: SCStreamOutputType) {
        print("Received stream output of type: \(type)")
        
        guard type == .screen else {
            print("Ignoring non-screen buffer")
            return
        }
        
        guard let imageBuffer = sampleBuffer.imageBuffer else {
            print("No image buffer in sample")
            return
        }
        
        print("Creating CIImage from buffer...")
        let ciImage = CIImage(cvImageBuffer: imageBuffer)
        
        print("Creating CGImage...")
        let context = CIContext()
        if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
            print("CGImage created successfully")
            latestImage = cgImage
            semaphore.signal()
        } else {
            print("Failed to create CGImage")
        }
    }
}

// MARK: - Error Types
enum ScreenCaptureError: Error {
    case failedToCreateConfiguration
    case failedToCreateStream
    case failedToTakeScreenshot
}

// MARK: - Timeout Helper
func runAsyncCommand(_ closure: @escaping () async throws -> Void) {
        let semaphore = DispatchSemaphore(value: 0)
        
        Task {
            do {
                try await closure()
                semaphore.signal()
            } catch {
                print("Error: \(error)")
                semaphore.signal()
            }
        }
        
        _ = semaphore.wait(timeout: .now() + 10.0) // 10 second timeout

}

func withTimeout<T>(seconds: TimeInterval, closure: @escaping () async throws -> T) async throws -> T {
    try await withThrowingTaskGroup(of: T.self) { group in
        group.addTask {
            try await closure()
        }
        
        group.addTask {
            try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
            throw ScreenCaptureError.failedToTakeScreenshot
        }
        
        let result = try await group.next()!
        group.cancelAll()
        return result
    }
}


class PolarisShell {
    private let tool = PolarisGUI()
    
    private let primary = ""
    private let deepPurple = "\u{001B}[38;5;104m"  // Deep purple for headers"
    private let purple = "\u{001B}[38;5;183m"    // Light purple for headers
    private let cyan = "\u{001B}[38;5;81m"       // Cyan for commands
    private let gray = "\u{001B}[38;5;245m"      // Gray for descriptions
    // private let yellow = "\u{001B}[38;5;222m"    // Yellow for parameters
    // private let green = "\u{001B}[38;5;114m"     // Green for examples

    
    func printUsage() {
        print("""
        \(deepPurple)Available commands:\(reset)
        
        \(deepPurple)MOUSE:\(reset)
        \(primary)move\(reset) \(primary)<dx> <dy>\(reset) \(gray)- Move mouse relative to current position\(reset)
        \(primary)moveto\(reset) \(primary)<x> <y>\(reset) \(gray)- Move mouse to absolute position\(reset)
        \(primary)click\(reset) \(gray)- Left click\(reset)
        \(primary)rclick\(reset) \(gray)- Right click\(reset)
        \(primary)drag\(reset) \(primary)<x1> <y1> <x2> <y2>\(reset) \(gray)- Drag from (x1,y1) to (x2,y2)\(reset)
        \(primary)scrollv\(reset) \(primary)<clicks>\(reset) \(gray)- Scroll vertically (positive = up)\(reset)
        \(primary)scrollh\(reset) \(primary)<clicks>\(reset) \(gray)- Scroll horizontally (positive = right)\(reset)
        \(primary)pos\(reset) \(gray)- Show current mouse position\(reset)
        
        \(deepPurple)KEYBOARD:\(reset)
        \(primary)key\(reset) \(primary)<key>\(reset) \(gray)- Press a single key\(reset)
        \(primary)keys\(reset) \(primary)<key1> <key2>\(reset) \(gray)- Press key combination\(reset)
        
        \(deepPurple)SCREENSHOT:\(reset)
        \(primary)shot\(reset) \(gray)- Take a screenshot\(reset)
        
        \(deepPurple)OTHER:\(reset)
        \(primary)help\(reset) \(gray)- Show this help\(reset)
        \(primary)exit\(reset) \(gray)- Exit the program\(reset)
        
        \(deepPurple)Examples:\(reset)
        \(primary)> moveto 500 500\(reset)    \(gray)(Move mouse to x=500, y=500)\(reset)
        \(primary)> click\(reset)             \(gray)(Perform left click)\(reset)
        \(primary)> keys command c\(reset)    \(gray)(Copy)\(reset)
        \(primary)> keys command v\(reset)    \(gray)(Paste)\(reset)
        """)
    }

private let colors = [
        "\u{001B}[38;5;183m",  // Light purple
        "\u{001B}[38;5;147m",  // Lighter purple
        "\u{001B}[38;5;146m",  // Medium purple
        "\u{001B}[38;5;104m",  // Deeper purple
        "\u{001B}[38;5;98m",   // Dark purple
        "\u{001B}[38;5;92m"    // Indigo
    ]
    private let reset = "\u{001B}[0m"
    
    private func printBanner() {
        let banner = [
            #" ______      _              _"#,
            #"(_____ \    | |            (_)"#,
            #" _____) )__ | | _____  ____ _  ___"#,
            #"|  ____/ _ \| |(____ |/ ___) |/___)  "#,
            #"| |   | |_| | |/ ___ | |   | |___ |"#,
            #"|_|    \___/ \_)_____|_|   |_(___/"#
        ]
        
        for (index, line) in banner.enumerated() {
            print(colors[index] + line + reset)
        }
    }
    
    func start() {
        printBanner()
        print("\nWelcome to Polaris Interactive Shell!")
        print("Type 'help' for available commands or 'exit' to quit.")
        
        while true {
            print("\n\(purple)polaris>\(reset) ", terminator: "")
            guard let input = readLine()?.trimmingCharacters(in: .whitespaces) else { exit(0) }
            
            let components = input.split(separator: " ").map(String.init)
            guard let command = components.first else { continue }
            
            switch command {
            case "exit", "quit":
                return
                
            case "help":
                printUsage()
                
            case "move":
                guard components.count == 3,
                      let dx = Double(components[1]),
                      let dy = Double(components[2]) else {
                    print("Usage: move <dx> <dy>")
                    continue
                }
                PolarisGUI.moveMouse(dx: CGFloat(dx), dy: CGFloat(dy))
                print("Moved by (\(dx), \(dy))")
                
            case "moveto":
                guard components.count == 3,
                      let x = Double(components[1]),
                      let y = Double(components[2]) else {
                    print("Usage: moveto <x> <y>")
                    continue
                }
                PolarisGUI.move(to: CGPoint(x: x, y: y))
                print("Moved to (\(x), \(y))")
                
            case "click":
                PolarisGUI.leftClick()
                print("Left click")
                
            case "rclick":
                PolarisGUI.rightClick()
                print("Right click")
                
            case "drag":
                guard components.count == 5,
                      let x1 = Double(components[1]),
                      let y1 = Double(components[2]),
                      let x2 = Double(components[3]),
                      let y2 = Double(components[4]) else {
                    print("Usage: drag <fromX> <fromY> <toX> <toY>")
                    continue
                }
                PolarisGUI.leftDragged(
                    to: CGPoint(x: x2, y: y2),
                    from: CGPoint(x: x1, y: y1)
                )
                print("Dragged from (\(x1), \(y1)) to (\(x2), \(y2))")
                
            case "scrollv":
                guard components.count == 2,
                      let clicks = Int(components[1]) else {
                    print("Usage: scrollv <clicks>")
                    continue
                }
                PolarisGUI.vscroll(clicks: clicks)
                print("Scrolled vertically by \(clicks)")
                
            case "scrollh":
                guard components.count == 2,
                      let clicks = Int(components[1]) else {
                    print("Usage: scrollh <clicks>")
                    continue
                }
                PolarisGUI.hscroll(clicks: clicks)
                print("Scrolled horizontally by \(clicks)")
                
            case "pos":
                var mouseLoc = NSEvent.mouseLocation
                mouseLoc.y = NSHeight(NSScreen.screens[0].frame) - mouseLoc.y
                print("Mouse position: (\(Int(mouseLoc.x)), \(Int(mouseLoc.y)))")
                
            case "key":
                guard components.count == 2 else {
                    print("Usage: key <keyname>")
                    continue
                }
                guard let key = keyMapping[components[1].lowercased()] else {
                    print("Unknown key: \(components[1])")
                    print("Available keys: \(Array(keyMapping.keys).sorted().joined(separator: ", "))")
                    continue
                }
                PolarisGUI.keyDown(key)
                PolarisGUI.keyUp(key)
                print("Pressed: \(components[1])")
                
            case "keys":
                guard components.count >= 3 else {
                    print("Usage: keys <key1> <key2> ...")
                    continue
                }
                let keys = components[1...].compactMap { keyMapping[$0.lowercased()] }
                if keys.count != components.count - 1 {
                    print("Some keys were not recognized")
                    continue
                }
                PolarisGUI.sendKeyShortcut(Array(keys))
                print("Pressed: \(components[1...].joined(separator: " + "))")
                
            case "shot":
                if #available(macOS 14.0, *) {
                    print("Taking screenshot...")
                    runAsyncCommand { [self] in
                        if try await self.tool.takeScreenshot() {
                            print("Screenshot completed successfully")
                        } else {
                            print("Screenshot failed")
                        }
                    }
                } else {
                    print("Screenshot requires macOS 12.3 or later")
                }
                
            default:
                print("Unknown command: \(command)")
                print("Type 'help' for available commands")
            }
        }
    }
}

let keyMapping: [String: Key] = [
    "a": .a, "b": .b, "c": .c, "d": .d, "e": .e,
    "f": .f, "g": .g, "h": .h, "i": .i, "j": .j,
    "k": .k, "l": .l, "m": .m, "n": .n, "o": .o,
    "p": .p, "q": .q, "r": .r, "s": .s, "t": .t,
    "u": .u, "v": .v, "w": .w, "x": .x, "y": .y,
    "z": .z,
    "command": .command, "shift": .shift, "control": .control,
    "option": .option, "space": .space, "enter": .enter,
    "tab": .tab, "escape": .escape, "delete": .delete,
    "return": .returnKey,
    "left": .leftArrow, "right": .rightArrow,
    "up": .upArrow, "down": .downArrow,
    "0": .zero, "1": .one, "2": .two, "3": .three,
    "4": .four, "5": .five, "6": .six, "7": .seven,
    "8": .eight, "9": .nine
]

// Create and start the shell
let shell = PolarisShell()
shell.start()