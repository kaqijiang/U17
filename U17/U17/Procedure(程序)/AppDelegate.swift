//
//  AppDelegate.swift
//  U17
//
//  Created by kaqi on 2018/1/22.
//  Copyright © 2018年 myself. All rights reserved.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var reachability: NetworkReachabilityManager? = {
        return NetworkReachabilityManager(host: "http:app.u17.com")
    }()
    //竖屏
    var orientation: UIInterfaceOrientationMask = .portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UITabBarController()
        window?.makeKeyAndVisible()//主窗口
        
        return true
    }

    func configBase () {
        
        let defaults = UserDefaults.standard
        if defaults.value(forKey: String.sexTypeKey) == nil {
            defaults.set(1, forKey:String.sexTypeKey)
            defaults.synchronize()
        }
        
        let defaultss = UserDefaults.standard
        if defaultss.value(forKey: String.sexTypeKey) == nil {
            defaultss.set(1, forKey: String.sexTypeKey)
        }
        
//        case NotReachable:       无网络
//        case ReachableViaWWAN:   通过2G/3G/4G连接
//        case ReachableViaWiFi:   通过Wifi连接
        
        reachability?.listener = { status in
            switch status {
            case .reachable(.wwan):
                print("移动网络")
            case .reachable(.ethernetOrWiFi):
                print("wifi")
            case .notReachable:
                print("无网络")
            default:
                break
            }
        }
        reachability?.startListening()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

