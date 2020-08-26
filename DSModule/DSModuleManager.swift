//
//  DSModuleManager.swift
//  DSModule
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2019 dfsx. All rights reserved.
//

import Foundation

class DSModuleManager {
    private var modules: [DSModuleProtocol] = []
    private var loadedModules: [DSModuleProtocol] = []
    private let lock:NSLock = NSLock()
    
    init() {
        
    }
    
    func registerModule(moduleClassName: String)->Void {
        
        guard let moduleType = NSClassFromString(moduleClassName) as? DSModuleProtocol.Type else {
            print("registerModule failed: \(moduleClassName)")
            return
        }
        modules.append(moduleType.init())
    }
    
    func loadAllModules()->Void {
        for module in modules {
            if module.setUpModule() {
                loadedModules.append(module)
            }
        }
    }
    
    func unloadAllModules() -> Void {
        for module in loadedModules {
            module.tearDownModule()
        }
        loadedModules.removeAll()
        
    }
    
    func subscribeCustomEvents(_ events: [DSModuleEvent], forModule moduleName: String)->Void {
        
    }
    
    func unsubscribeCustomEvents(_events: [DSModuleEvent], forModule moduleName: String)->Void {
        
    }
    
    func triggerEvent(_ event: DSModuleEvent, withArgs args: DSModuleEventItem)->Void {
        for module in loadedModules {
            module.handleDSModuleEvent(event, withArgs: args)
        }
    }
}
