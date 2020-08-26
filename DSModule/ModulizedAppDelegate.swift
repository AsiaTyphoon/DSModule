//
//  DSAppDelegate.swift
//  DSModule
//
//  Created by dfsx6 on 2020/8/26.
//  Copyright © 2019 dfsx. All rights reserved.
//

import Foundation

//MARK:- 可以使用，解耦度更高
/*
open class ModulizedAppDelegate : UIResponder, UIApplicationDelegate {

    //MARK:-  system
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        registerModules()
        DSModule.shared.setUp()

        let args = DSModuleAppEventItem(sender: self, application: application, launchOptions: launchOptions)
        DSModule.shared.triggerEvent(.AppDidFinishLaunching, withArgs: args)

        return true
    }

    open func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.

        let args = DSModuleAppEventItem(sender: self, application: application)
        DSModule.shared.triggerEvent(.AppWillResignActive, withArgs: args)
    }

    open func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

        let args = DSModuleAppEventItem(sender: self, application: application)
        DSModule.shared.triggerEvent(.AppDidEnterBackground, withArgs: args)
    }

    open func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.

        let args = DSModuleAppEventItem(sender: self, application: application)
        DSModule.shared.triggerEvent(.AppWillEnterForeground, withArgs: args)
    }

    open func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

        let args = DSModuleAppEventItem(sender: self, application: application)
        DSModule.shared.triggerEvent(.AppDidBecomeActive, withArgs: args)
    }

    open func applicationWillTerminate(_ application: UIApplication) {
        DSModule.shared.tearDown()
    }

    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        let args = DSModuleAppEventItem(sender: self, application: application, context: deviceToken)
        DSModule.shared.triggerEvent(.AppDidRegisterForRemoteNotifications, withArgs: args)
    }

    open func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

        let args = DSModuleAppEventItem(sender: self, application: application, context: error)
        DSModule.shared.triggerEvent(.AppDidFailToRegisterForRemoteNotifications, withArgs: args)

    }

    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        let args = DSModuleAppEventItem(sender: self, application: application, context: userInfo)
        DSModule.shared.triggerEvent(.AppDidReceiveRemoteNotification, withArgs: args)
        completionHandler(.newData)
    }

    //MARK:-  custom
    open func registerModules() {

    }

    public func registerModule(bundleIdentifier: String, moduleClassName: String) {
        DSModule.shared.registerModule(bundleIdentifier: bundleIdentifier, moduleClassName: moduleClassName)
    }
}
*/
