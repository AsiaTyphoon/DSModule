//
//  LoginModule.swift
//  Login
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2020 tg.ltd. All rights reserved.
//

import UIKit
import DSModule
import Core

//MARK:-
open class LoginModule: DSModuleProtocol {
    public required init() {
        
    }
    
    public var name: String {
        return "Login"
    }
    
    public func setUpModule() -> Bool {
        return true
    }
    
    public func tearDownModule() {
        
    }
    
    public func handleDSModuleEvent(_ event: DSModuleEvent, withArgs args: DSModuleEventItem) {
        
        switch event {
        case .sceneWillConnectTo:
            let vc = LoginViewController.init()
            let navc = BaseNavigationController.init(rootViewController: vc)
            UIApplication.shared.windows.first?.backgroundColor = .white
            UIApplication.shared.windows.first?.rootViewController = navc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            break
        default:
            break
        }
    }
}
