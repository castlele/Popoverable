import Cocoa
import SwiftUI

public struct Popover<AppDelegate: PopoverHolder>: Scene {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    public init(@ViewBuilder content: @escaping () -> AppDelegate.ContentView) {
        appDelegate.contentView = content
    }

    public var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
