//
//  Constants.swift
//  StatusControl
//
//  Created by Oliver Mastny on 25/02/16.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

struct Constants {
    
    internal struct ScreensaverKeys {
        static let AskForPassword = "askForPassword"
        static let AskForPasswordDelay = "askForPasswordDelay"
        static let TokenRemovalAction = "tokenRemovalAction"
    }
    
    internal struct Commands {
        static let Defaults = "defaults"
        static let Killall = "killall"
        
        internal struct Arguments {
            static let Finder = "Finder"
            static let Read = "read"
            static let Write = "write"
            static let Finder_com = "com.apple.finder"
            static let Show_all_files = "AppleShowAllFiles"
        }
    }
    
    internal struct ImageNames {
        static let StatusBarButtonImage_active = "StatusBarButtonImage-active"
        static let StatusBarButtonImage_inactive = "StatusBarButtonImage-inactive"
    }
    
}
