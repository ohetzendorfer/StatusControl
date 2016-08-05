//
//  Shell.swift
//  StatusControl
//
//  Created by Oliver Mastny on 04/08/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import Foundation

internal struct Shell {
    
    internal static func runCommand(command: String, arguments: String...) -> String? {
        var result = [String]()
        // var error = [String]() // TODO: handle error
        
        let task = NSTask()
        task.launchPath = "/usr/bin/\(command)"
        task.arguments = arguments
        
        let resultPipe = NSPipe()
        task.standardOutput = resultPipe
        let errorPipe = NSPipe()
        task.standardError = errorPipe
        task.launch()
        
        let outdata = resultPipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String.fromCString(UnsafePointer(outdata.bytes)) {
            string = string.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
            result = string.componentsSeparatedByString("\n")
        }
        
        // TODO: error handling
        //        let errorData = errpipe.fileHandleForReading.readDataToEndOfFile()
        //        if var string = String.fromCString(UnsafePointer(errorData.bytes)) {
        //            string = string.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
        //            error = string.componentsSeparatedByString("\n")
        //        }
        
        task.waitUntilExit()
        if let result = result.first {
            return result
        }
        
        return nil
    }
    
    
}