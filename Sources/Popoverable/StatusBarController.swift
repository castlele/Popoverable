import Cocoa

open class StatusBarController {

    private weak var popover: NSPopover?

    public var statusItem: NSStatusItem
    public var appearance: Appearance

    public init(popover: NSPopover, appearanceConfigurator: Appearance = .init()) {
        self.popover = popover
        self.appearance = appearanceConfigurator
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        configureAppearance()
    }

    open func configureAppearance() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        let image = appearance.image ?? NSImage(systemSymbolName: "photo.artframe",
                                                accessibilityDescription: nil)

        let action = appearance.action ?? #selector(openMainView(_:))

        statusItem.button?.image = image
        statusItem.button?.action = action
        statusItem.button?.target = self
    }

    @objc private func openMainView(_ sender: Any?) {
        if popover?.isShown == true {
            popover?.performClose(sender)

        } else {
            guard let button = statusItem.button else {
                return
            }

            popover?.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }
}

extension StatusBarController {

    public struct Appearance {
        public var image: NSImage?
        public var action: Selector?

        public init(image: NSImage? = nil,
                    action: Selector? = nil) {

            self.image = image
            self.action = action
        }
    }
}
