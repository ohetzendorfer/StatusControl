//
//  Terminal.swift
//  StatusControl
//
//  Created by Oliver Mastny on 25/02/16.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import Foundation

internal struct Terminal {
    
    internal static func showAllFiles(boolArgument: Bool) {
        var boolString = "false"
        if boolArgument {
            boolString = "true"
        }
        Shell.runCommand("defaults", arguments: "write", "com.apple.finder", "AppleShowAllFiles", boolString)
        killallFinder()
    }
    
    internal static func showAllFilesActive() -> Bool {
        let result = Shell.runCommand("defaults", arguments: "read", "com.apple.finder", "AppleShowAllFiles")
        if result == "true" {
            return true
        } else {
            return false
        }
    }
    
    private static func killallFinder() {
        Shell.runCommand("killall", arguments: "Finder")
    }
    
}
