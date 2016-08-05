//
//  Menu.swift
//  StatusControl
//
//  Created by Oliver Mastny on 04/08/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import Cocoa

class MenuHandler: NSObject {
    
    private let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)
    private var showOrHideFilesMenuItem: NSMenuItem!
    
    // MARK: - Init
    override init() {
        super.init()
        
        setupMenu()
    }
    
    internal func setupMenu() {
        let menu = NSMenu()
        menu.delegate = self
        
        guard let title = getCurrentAllFilesTitleAndSetBarButtonImage() else {
            return
        }
        
        showOrHideFilesMenuItem = NSMenuItem(title: title, action: #selector(showOrHideFinder(_:)), keyEquivalent: "f")
        let seperatorMenuItem = NSMenuItem.separatorItem()
        let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(quitApp(_:)), keyEquivalent: "q")
        
        showOrHideFilesMenuItem.target = self
        seperatorMenuItem.target = self
        quitMenuItem.target = self
        
        menu.addItem(showOrHideFilesMenuItem)
        menu.addItem(seperatorMenuItem)
        menu.addItem(quitMenuItem)
        
        statusItem.menu = menu
    }
    
    // MARK: - Operations
    private dynamic func showOrHideFinder(sender: AnyObject) {
        if let showAllFilesActive = Terminal.showAllFilesActive() {
            Terminal.showAllFiles(!showAllFilesActive)
            setShowOrHideFilesMenuItem()
        }
    }
    
    private dynamic func quitApp(sender: AnyObject) {
        NSApp.terminate(self)
    }
    
    // MARK: - Helpers
    private func setStatusItemButtonImage(imageName: String) {
        if let button = statusItem.button {
            button.image = NSImage(named: imageName)
        }
    }
    
    private func setShowOrHideFilesMenuItem() {
        if let title = getCurrentAllFilesTitleAndSetBarButtonImage() {
            showOrHideFilesMenuItem.title = title
        }
    }
    
    private func getCurrentAllFilesTitleAndSetBarButtonImage() -> String? {
        guard let showAllFilesActive = Terminal.showAllFilesActive() else {
            return nil
        }
        
        if showAllFilesActive {
            setStatusItemButtonImage(Constants.ImageNames.StatusBarButtonImage_active)
            return "Hide All Files"
        } else {
            setStatusItemButtonImage(Constants.ImageNames.StatusBarButtonImage_inactive)
            return "Show All Files"
        }
    }
    
}

// MARK: - NSMenuDelegate
extension MenuHandler: NSMenuDelegate {
    
    func menuWillOpen(menu: NSMenu) {
        setShowOrHideFilesMenuItem()
    }
    
}
