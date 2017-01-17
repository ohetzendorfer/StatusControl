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
    
    var menuHandler: MenuHandler?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        menuHandler = MenuHandler()
    }
    
}
