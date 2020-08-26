//
//  DSRouter.swift
//  DSRouter
//
//  Created by dfsx1 on 2019/1/22.
//  Copyright © 2019年 成都东方盛行电子有限公司. All rights reserved.
//

import UIKit


/// 传值闭包
public typealias CodeBlock = ((Any?) -> ())

// 跳转方式，目前只支持下面几种
enum TransitionStyle {
    case push
    case present
}

open class DSRouter: NSObject {

    // 单例
    static fileprivate let shared = DSRouter()
    
    //MARK:-  public method
    
    /// push跳转
    /// - parameter className : 控制器名称（带命名空间 T.className ）
    /// - returns : 无
    static public func push(_ className: String) {
        shared.route(className, nil, .push, nil)
    }
    
    /// push跳转
    /// - parameter className : 控制器名称（带命名空间 T.className ）
    /// - parameter positiveParameter : 正向传递值
    /// - returns : 无
    static public func push(_ className: String, _ positiveParameter: Any?) {
        shared.route(className, positiveParameter, .push, nil)
    }
    
    /// push跳转
    /// - parameter className : 控制器名称（带命名空间 T.className ）
    /// - parameter positiveParameter : 正向传递值
    /// - parameter reverseBlock : 反向传递值闭包
    /// - returns : 无
    static public func push(_ className: String, _ positiveParameter: Any?, _ reverseBlock: CodeBlock?) {
        shared.route(className, positiveParameter, .push, reverseBlock)
    }
    
    /// present跳转
    /// - parameter className : 控制器名称（带命名空间 T.className ）
    /// - returns : 无
    static public func present(_ className: String) {
        shared.route(className, nil, .present, nil)
    }
    
    /// present跳转
    /// - parameter className : 控制器名称（带命名空间 T.className ）
    /// - parameter positiveParameter : 正向传递值
    /// - returns : 无
    static public func present(_ className: String, _ positiveParameter: Any?) {
        shared.route(className, positiveParameter, .present, nil)
    }
    
    /// present跳转
    /// - parameter className : 控制器名称（带命名空间 T.className ）
    /// - parameter positiveParameter : 正向传递值
    /// - parameter reverseBlock : 反向传递值闭包
    /// - returns : 无
    static public func present(_ className: String, _ positiveParameter: Any?, _ reverseBlock: CodeBlock?) {
        shared.route(className, positiveParameter, .present, reverseBlock)
    }
    
    
    //MARK:- private method
    fileprivate func route(_ className: String, _ positiveParameter: Any?, _ transition: TransitionStyle, _ reverseBlock: CodeBlock?) {
        
        if let targetClass = NSClassFromString(className) as? UIViewController.Type {
            
            let targetController = targetClass.init()
            targetController.positiveParameter = positiveParameter
            targetController.reverseBlock = reverseBlock
            
            if let currentController = currentTopViewController() {
                
                if transition == .push {
                    if let _ = currentController.navigationController {
                        currentController.navigationController?.pushViewController(targetController, animated: true)
                    }
                    else {
                        print("navigationController of currentController is nil")
                    }
                }
                else if transition == .present {
                    currentController.present(targetController, animated: true, completion: nil)
                }
                
            }
            else {
                print("there is no top view controller")
            }
        }
        else {
            print("can't find a class name for : \(className)")
        }
        
    }
    
    
    //获取当前页面
    fileprivate func currentTopViewController() -> UIViewController? {
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController{
            return currentTopViewController(rootViewController: rootViewController)
        }else{
            return nil
        }
    }
    
    fileprivate func currentTopViewController(rootViewController: UIViewController) -> UIViewController {
        
        if let tabbarController = rootViewController as? UITabBarController {
            return self.currentTopViewController(rootViewController: tabbarController.selectedViewController!)
        }
        else if let navigationController = rootViewController as? UINavigationController {
            return self.currentTopViewController(rootViewController: navigationController.visibleViewController!)
        }
        else if let presentedController = rootViewController.presentedViewController {
            return self.currentTopViewController(rootViewController: presentedController)
        }
        else {
            return rootViewController
        }
    }
    
}

//MARK:-
extension UIViewController {
    
    //TODO: 扩展正/反向传值属性
    fileprivate struct RP {
        static let positivePointer = UnsafePointer<Any>.init(bitPattern: "positivePointer".hashValue)
        static let reversePointer = UnsafePointer<Any>.init(bitPattern: "reversePointer".hashValue)
    }
    
    /// 正向传值
    public var positiveParameter: Any? {
        set { objc_setAssociatedObject(self, RP.positivePointer!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
        get { return objc_getAssociatedObject(self, RP.positivePointer!) }
    }
    
    /// 反向传值闭包
    public var reverseBlock: CodeBlock? {
        set { objc_setAssociatedObject(self, RP.reversePointer!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
        get { return objc_getAssociatedObject(self, RP.reversePointer!) as? CodeBlock }
    }
    
}
