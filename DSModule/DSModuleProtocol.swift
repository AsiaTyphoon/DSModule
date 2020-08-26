//
//  DSDSModuleProtocol.swift
//  DSModule
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2019 dfsx. All rights reserved.
//

import Foundation

public protocol DSModulelizable {
    init()
}

public protocol DSModuleProtocol: DSModulelizable {
    
    var name: String { get }
    
    func setUpModule()->Bool
    
    func tearDownModule()->Void
    
    func handleDSModuleEvent(_ event: DSModuleEvent, withArgs args: DSModuleEventItem) -> Void
}

