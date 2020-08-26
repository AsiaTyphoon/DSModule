//
//  DSModuleService.swift
//  DSModule
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2019 dfsx. All rights reserved.
//

import Foundation

protocol ServiceFactory {
    associatedtype ServiceType
    
    func getService()->ServiceType?
}

class TypeBasedServiceFactory<S, T: DSModulelizable> : ServiceFactory {
    private let concreteType : T.Type
    private var singletonInstance : T? = nil
    private var singleton : Bool = false
    
    init(concreteType: T.Type, singleton: Bool) {
        self.concreteType = concreteType
        self.singleton = singleton
    }
    
    func getService() -> S? {
        if singleton {
            if singletonInstance == nil {
                singletonInstance = concreteType.init()
            }
            return singletonInstance as? S
        } else {
            return concreteType.init() as? S
        }
    }
}

class DSModuleService {
    typealias ServiceCreator = ()->Any?
    private var serviceFactoryDict: [String: ServiceCreator] = [:]
    private var serviceFactoryDictLock:NSLock = NSLock()
    private var singletonServiceCache : [String:Any]=[:]
    private var singletonServiceCacheLock:NSLock = NSLock()
    
    
    init() {
    }
    
    func registerService<S, T: DSModulelizable>(_ serviceType: S.Type, concreteType: T.Type, singleton: Bool)->Void {
        let factory = TypeBasedServiceFactory<S, T>(concreteType: concreteType, singleton: singleton)
        registerService(serviceType, creator : factory.getService)
    }
    
    func registerService<S>(_ serviceType: S.Type, creator: @escaping ()->S?)->Void {
        serviceFactoryDictLock.lock()
        serviceFactoryDict[String(describing: serviceType)] = creator
        serviceFactoryDictLock.unlock()
    }
    
    func unregisterService<S>(_ serviceType: S.Type)->Void {
        serviceFactoryDictLock.lock()
        serviceFactoryDict.removeValue(forKey: String(describing: serviceType))
        serviceFactoryDictLock.unlock()
    }
    
    func getServiceInstance<S>(_ serviceType: S.Type)->S? {
        var instance: S? = nil
        var creator: ServiceCreator? = nil
        serviceFactoryDictLock.lock()
        creator = serviceFactoryDict[String(describing: serviceType)]
        serviceFactoryDictLock.unlock()
       
        if let _ = creator, let result = creator!() {
            instance = result as? S
        }
        
        return instance
    }
}
