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
        
        showOrHideFilesMenuItem = NSMenuItem(title: getCurrentAllFilesTitleAndSetBarButtonImage(), action: #selector(showOrHideFinder(_:)), keyEquivalent: "f")
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
        Terminal.showAllFiles(!Terminal.showAllFilesActive())
        setShowOrHideFilesMenuItem()
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
        showOrHideFilesMenuItem.title = getCurrentAllFilesTitleAndSetBarButtonImage()
    }
    
    private func getCurrentAllFilesTitleAndSetBarButtonImage() -> String {
        if Terminal.showAllFilesActive() {
            setStatusItemButtonImage("StatusBarButtonImage-active")
            return "Hide All Files"
        } else {
            setStatusItemButtonImage("StatusBarButtonImage-inactive")
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
