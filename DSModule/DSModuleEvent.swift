//
//  DSModuleEvent.swift
//  DSModule
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2019 dfsx. All rights reserved.
//

import UIKit


public enum DSModuleEvent {
    case AppDidFinishLaunching
    case sceneWillConnectTo
    case AppWillResignActive
    case AppDidEnterBackground
    case AppWillEnterForeground
    case AppDidBecomeActive
    case AppDidReceiveMemoryWarning
    case AppDidRegisterForRemoteNotifications
    case AppDidFailToRegisterForRemoteNotifications
    case AppDidReceiveRemoteNotification
    case CustomEvent
}

public protocol DSModuleEventItem {
    var sender: Any? { get }
}

public struct DSModuleAppEventItem : DSModuleEventItem {
    public internal(set) var sender: Any?
    public var application: UIApplication?
    public var launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    public var context: Any?
    
    public init(sender: Any?,
                application: UIApplication? = nil,
                launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil,
                context: Any? = nil) {
        
        self.sender = sender
        self.application = application
        self.launchOptions = launchOptions
        self.context = context
    }
}

public struct ModuleCustomEventArgs : DSModuleEventItem {
    public var sender: Any?
    public var subEvent: String
    public var context: Any?
}


