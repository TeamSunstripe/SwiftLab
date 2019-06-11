//
//  AppDelegate.swift
//  testCode
//
//  Created by YouOhshima on 2019/05/15.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    #if swift(>=4.2)
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("%@",FileOperation.shared.openResourcePlist(resource: "SettingList") as Any)
        print("%@",FileOperation.shared.documentDirectoryFile(filePath: "SettingList.plist") as Any)
        print("%@",FileOperation.shared.bundleFile(resource: "SettingList",type: "plist") as Any)
        
        //存在確認
        if FileOperation.shared.isFileExists(filePath: "SettingList.plist") {
            
        }
        //コピー処理
        if FileOperation.shared.copyFiles(atPath: "SettingList.plist", toPath: "SettingList.plist") {
            
        }
        //ファイル名変更処理
        if FileOperation.shared.moveFiles(atPath: "SettingList.plist", toPath: "SettingList2.plist") {
            
        }
        //ファイル削除
        if FileOperation.shared.removeFile(atPath: "SettingList.plist") {
            
        }
        //ディレクトリー作成
        if FileOperation.shared.createDirectory(atDirectoryPath: "Setting") {
            
        }
        //ディレクトリー削除
        if FileOperation.shared.removeDirectory(atDirectoryPath: "Setting") {
            
        }
        if FileOperation.shared.writeResource(resourcePlist: "sample.plist", putData: ["sample":[:]]) {
            print("%@",FileOperation.shared.openResource(resourcePlist: "sample.plist")!)
            let filePath = FileOperation.shared.documentDirectoryFile(filePath: "sample.plist")!
            if FileOperation.shared.isFileExists(filePath: FileOperation.shared.documentDirectoryFile(filePath: "sample.plist")!) {
                if FileOperation.shared.removeFile(atPath: filePath) {
                    print("%@",FileOperation.shared.openResource(resourcePlist: "sample.plist") as Any)
                }
            }
        }
        
        
    return true
    }
    #else
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    #endif
    
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

