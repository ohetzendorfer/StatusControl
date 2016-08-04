//
//  AppDelegate.swift
//  StatusControl
//
//  Created by Oliver Mastny on 25/02/16.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var menuHandler: MenuHandler!

    // MARK: - App LifeCycle
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        Appearance.setup()
        menuHandler = MenuHandler()
    }
    
}
