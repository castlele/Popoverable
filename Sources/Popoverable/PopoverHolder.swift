import Cocoa
import SwiftUI

public protocol PopoverHolder: NSObject, NSApplicationDelegate {
    associatedtype ContentView: View

    var contentView: (() -> ContentView)? { get set }
    var statusBarController: StatusBarController? { get set }
}
