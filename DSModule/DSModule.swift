//
//  DSDSModule.swift
//  DSModule
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2019 dfsx. All rights reserved.
//

import Foundation


//MARK:-
public class DSModule {
    private let moduleManager: DSModuleManager = DSModuleManager()
    private let myService: DSModuleService = DSModuleService()
    
    public static let shared: DSModule = DSModule()
    
    private init() {
    }
    
    func registerModule(moduleClassName: String)->Void {
        moduleManager.registerModule(moduleClassName: moduleClassName)
    }
    
    func setUp() {
        moduleManager.loadAllModules()
    }
    
    func tearDown() {
        moduleManager.unloadAllModules()
    }
    
    func triggerEvent(_ event: DSModuleEvent, withArgs args: DSModuleEventItem)->Void {
        moduleManager.triggerEvent(event, withArgs: args)
    }
    
    public func triggerCustomEvent(sender: Any?, subEvent: String, context: Any?)->Void {
        let args: ModuleCustomEventArgs = ModuleCustomEventArgs(sender: sender, subEvent: subEvent, context: context)
        moduleManager.triggerEvent(.CustomEvent, withArgs: args)
    }
    
    public func registerService<S, T: DSModulelizable>(_ serviceType : S.Type, concreteType : T.Type, singleton : Bool)->Void {
        myService.registerService(serviceType, concreteType: concreteType, singleton: singleton)
    }
    
    public func registerService<S>(_ serviceType: S.Type, creator: @escaping ()->S?)->Void {
        myService.registerService(serviceType, creator: creator)
    }
    
    public func unregisterService<S>(_ serviceType: S.Type)->Void {
        myService.unregisterService(serviceType)
    }
    
    public func getServiceInstance<S>(_ serviceType: S.Type)->S? {
        return myService.getServiceInstance(serviceType)
    }
}

//MARK:-
extension DSModule {
    public static func registerModules(moduleClassNames: [String]) {
        for name in moduleClassNames {
            shared.moduleManager.registerModule(moduleClassName: name)
        }
        shared.setUp()
    }
    
    public static func triggerEvent(_ event: DSModuleEvent, withArgs args: DSModuleEventItem)->Void {
        shared.moduleManager.triggerEvent(event, withArgs: args)
    }
}

