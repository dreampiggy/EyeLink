//
//  AppDelegate.swift
//  EyeLink_Client
//
//  Created by 赵磊 on 15/11/14.
//  Copyright © 2015年 赵磊. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        let vc = photoVC()
//        let vc = LoginViewController()
        let vc = HomeVC()
        var navi = CustomNavigationController()
        navi = CustomNavigationController(rootViewController: vc)
        navi.navigationBarHidden = true
        self.window?.rootViewController = navi
        
//      注册远程推送通知(iOS 8.0+)
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        SMSSDK.registerApp("c4f0a28c4513", withSecret: "5a60d2e88c8e16d077d554a1f7905e45")
        
        
        return true
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("远程推送注册成功!\(deviceToken)")
//        服务端应将token存储在数据库中改，以备以后重复使用
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("远程推送注册失败!\(error)")
    }
    
//  收到远程推送通知后（iOS 8.0+）
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        
        let notif = userInfo as NSDictionary
        
        let apsDic = notif.objectForKey("aps") as! NSDictionary
        
        let alertDic = apsDic.objectForKey("alert") as! String

        let alertController = UIAlertController(title: "监控通知!", message: alertDic, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "报警", style: UIAlertActionStyle.Destructive) { (action) -> Void in
            self.callPhone(action)
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(alertAction)
        
        self.window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func callPhone(sender:AnyObject){
        UIApplication.sharedApplication().openURL(NSURL(string: "tel:110")!)
    }
    
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

