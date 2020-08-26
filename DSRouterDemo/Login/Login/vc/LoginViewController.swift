//
//  LoginViewController.swift
//  Login
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2020 tg.ltd. All rights reserved.
//

import UIKit
import Core
import DSModule

//MARK:-
class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "登录"
        
        let btn = UIButton.init()
        btn.frame = CGRect.init(x: 0, y: 0, width: 200, height: 100)
        btn.center = view.center
        btn.backgroundColor = .red
        btn.setTitle("用户信息", for: .normal)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        view.addSubview(btn)
        
    }

}

//MARK:-
extension LoginViewController {
    ///
    @objc fileprivate func btnAction(_ sender: Any?) {
        guard let targetVC = DSModule.shared.getServiceInstance(UserService.self)?.getUserViewController() else {
            print("获取用户主页失败", #file, #function)
            return
        }
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
}
