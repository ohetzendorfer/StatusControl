//
//  Menu.swift
//  StatusControl
//
//  Created by Oliver Mastny on 04/08/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import Cocoa

class MenuHandler: NSObject {
    
    // MARK: - Properties
    fileprivate let statusItem = NSStatusBar.system().statusItem(withLength: -2)
    fileprivate var showOrHideFilesMenuItem: NSMenuItem!
    
    // MARK: - Init
    override init() {
        super.init()
        
        setupMenu()
    }
    
    // MARK: - Helpers
    internal func setupMenu() {
        let menu = NSMenu()
        menu.delegate = self
        
        guard let title = getCurrentFilesTitleAndSetBarButtonImage() else {
            return
        }
        
        showOrHideFilesMenuItem = NSMenuItem(title: title, action: #selector(showOrHideFinder(_:)), keyEquivalent: "f")
        let seperatorMenuItem = NSMenuItem.separator()
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
    fileprivate dynamic func showOrHideFinder(_ sender: AnyObject) {
        if let showAllFilesActive = Terminal.showAllFilesActive() {
            Terminal.showAllFiles(!showAllFilesActive)
            setShowOrHideFilesMenuItem()
        }
    }
    
    fileprivate dynamic func quitApp(_ sender: AnyObject) {
        NSApp.terminate(self)
    }
    
    // MARK: - Helpers
    fileprivate func setStatusItemButton(withImageName imageName: String) {
        if let button = statusItem.button {
            button.image = NSImage(named: imageName)
        }
    }
    
    fileprivate func setShowOrHideFilesMenuItem() {
        if let title = getCurrentFilesTitleAndSetBarButtonImage() {
            showOrHideFilesMenuItem.title = title
        }
    }
    
    fileprivate func getCurrentFilesTitleAndSetBarButtonImage() -> String? {
        guard let showAllFilesActive = Terminal.showAllFilesActive() else {
            return nil
        }
        
        if showAllFilesActive {
            setStatusItemButton(withImageName: Constants.ImageNames.StatusBarButtonImage_active)
            return "Hide All Files"
        } else {
            setStatusItemButton(withImageName: Constants.ImageNames.StatusBarButtonImage_inactive)
            return "Show All Files"
        }
    }
    
}

// MARK: - NSMenuDelegate
extension MenuHandler: NSMenuDelegate {

    func menuWillOpen(_ menu: NSMenu) {
        setShowOrHideFilesMenuItem()
    }
    
}
