//
//  UserServiceImp.swift
//  User
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2020 tg.ltd. All rights reserved.
//

import UIKit
import Core
import DSModule

class UserServiceImp: UserService, DSModulelizable {
    required init() {
        
    }
    
    func getUserViewController() -> UIViewController? {
        let targetVC = UserViewController.init()
        return targetVC
    }
}
