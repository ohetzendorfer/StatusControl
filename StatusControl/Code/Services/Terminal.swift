//
//  Terminal.swift
//  StatusControl
//
//  Created by Oliver Mastny on 25/02/16.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import Foundation

internal struct Terminal {
    
    enum ResultState: String {
        case yes = "YES"
        case no = "NO"
        case trueState = "true"
        case falseState = "false"
    }
    
    internal static func showAllFiles(boolArgument: Bool) {
        let boolString = boolArgument ? "true" : "false"
        
        Shell.runCommand(Constants.Commands.Defaults, arguments: Constants.Commands.Arguments.Write, Constants.Commands.Arguments.Finder_com, Constants.Commands.Arguments.Show_all_files, boolString)
        killallFinder()
    }
    
    internal static func showAllFilesActive() -> Bool? {
        guard let
            result = Shell.runCommand(Constants.Commands.Defaults, arguments: Constants.Commands.Arguments.Read, Constants.Commands.Arguments.Finder_com, Constants.Commands.Arguments.Show_all_files),
            state = ResultState(rawValue: result) else {
                return nil
        }
        
        switch state {
        case .yes, .trueState:
            return true
        case .no, .falseState:
            return false
        }
    }
    
    private static func killallFinder() {
        Shell.runCommand(Constants.Commands.Killall, arguments: Constants.Commands.Arguments.Finder)
    }
    
}
