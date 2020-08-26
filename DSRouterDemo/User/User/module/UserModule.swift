//
//  UserModule.swift
//  User
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2020 tg.ltd. All rights reserved.
//

import Foundation
import DSModule
import Core

//MARK:-
open class UserModule: DSModuleProtocol {
    public required init() {
        
    }
    
    public var name: String {
        return "User"
    }
    
    public func setUpModule() -> Bool {
        DSModule.shared.registerService(UserService.self, concreteType: UserServiceImp.self, singleton: true)
        return true
    }
    
    public func tearDownModule() {
        
    }
    
    public func handleDSModuleEvent(_ event: DSModuleEvent, withArgs args: DSModuleEventItem) {
        
        switch event {
        case .sceneWillConnectTo:
            break
        default:
            break
        }
    }
}
