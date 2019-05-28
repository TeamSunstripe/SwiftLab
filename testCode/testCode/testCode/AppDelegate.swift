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
        print("%@",openResourcePlist(resource: "SettingList") as Any)
        print("%@",documentDirectoryFile(filePath: "SettingList.plist") as Any)
        print("%@",bundleFile(resource: "SettingList",type: "plist") as Any)
        
        //存在確認
        if isFileExists(filePath: "SettingList.plist") {
            
        }
        //コピー処理
        if copyFiles(atPath: "SettingList.plist", toPath: "SettingList.plist") {
            
        }
        //ファイル名変更処理
        if moveFiles(atPath: "SettingList.plist", toPath: "SettingList2.plist") {
            
        }
        //ファイル削除
        if removeFile(atPath: "SettingList.plist") {
            
        }
        //ディレクトリー作成
        if createDirectory(atDirectoryPath: "Setting") {
            
        }
        //ディレクトリー削除
        if removeDirectory(atDirectoryPath: "Setting") {
            
        }
        if writeResource(resourcePlist: "sample.plist", putData: ["sample":[:]]) {
            print("%@",openResource(resourcePlist: "sample.plist")!)
            let filePath = documentDirectoryFile(filePath: "sample.plist")!
            if isFileExists(filePath: documentDirectoryFile(filePath: "sample.plist")!) {
                if removeFile(atPath: filePath) {
                    print("%@",openResource(resourcePlist: "sample.plist") as Any)
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

    // A 読取専用
    func openResourcePlist( resource: String) -> Any?{
        var plist: NSDictionary = ["url":resource]
        var plistData: Any? = nil
        if let urls = Bundle.main.path(forResource: resource , ofType:"plist" ) {
            
            if( FileManager.default.fileExists( atPath: urls ) ) {
                
                print("ファイルあり")
                
                plistData = NSDictionary(contentsOfFile: urls)
                
                if plistData == nil {
                    plistData = NSArray(contentsOfFile: urls)
                    plist = [
                        "url":resource,
                        "fileType":"Array",
                        "data":plistData!,
                    ]
                } else {
                    if plistData != nil {
                        plist = [
                            "url":resource,
                            "fileType":"Dictionary",
                            "data":plistData!,
                        ]
                    }
                }
            } else {
                
                print("ファイルなし")
                
            }
        }
        
        
        return plist
    }
    
    // B 読取&書込
    func writeResource( resourcePlist: String, putData: NSDictionary?) -> Bool{
        //登録したいデータ
        //NSDictionaryとして作る。 keyは必ずString。
        
        //書き込む
        let manager = FileManager.default
        let documentDir = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url:URL = documentDir.appendingPathComponent(resourcePlist)
        if putData != nil {
            putData?.write(to:url, atomically: true)
            return true
        }
        return false
    }
    
    
    // B 読取&書込
    func openResource( resourcePlist: String) -> Any?{
        //NSDictionaryとして読み込む
        let manager = FileManager.default
        let documentDir = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentDir.appendingPathComponent(resourcePlist)
        if isFileExists(filePath: url.path) {
            return NSDictionary(contentsOfFile: url.path)
        }
        return nil
    }
    
    /// Documentsフォルダのファイルを取得
    func documentDirectoryFile( filePath: String) -> String? {
        var path: String? = nil
        if let dir = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first {
            
            print("ファイルあり")
            
            let filePath = dir.appendingPathComponent( filePath )
            path = filePath.path
            print(path!)
        } else {
            
            print("ファイルなし")
            
        }
        return path
    }
    
    /// アプリにバンドルされているファイルを取得
    func bundleFile( resource: String, type: String) -> String? {
        if let path: String = Bundle.main.path( forResource: resource, ofType: type ) {
            
            print("ファイルあり")
            print(path)
            return path
        } else {
            
            print("ファイルなし")
            
        }
        return nil
    }
    
    /// ファイルの存在確認
    func isFileExists(filePath:String) -> Bool {
        if( FileManager.default.fileExists( atPath: filePath ) ) {
            
            print("ファイルあり")
            
            return true
        } else {
            
            print("ファイルなし")
            
        }
        return false
    }
    
    /// ファイルのコピー
    func copyFiles( atPath: String, toPath: String ) -> Bool {
        do {
            
            try FileManager.default.copyItem( atPath: atPath, toPath: toPath )
            
            print("ファイルコピーされました")
            return true
        } catch {
            
            //エラー処理
            print("ファイルコピーされませんでした")
            return false
        }
    }
    
    /// ファイル名の変更（ファイルの移動）
    func moveFiles( atPath: String, toPath: String ) -> Bool {
        do {
            
            try FileManager.default.moveItem( atPath: atPath, toPath: toPath )
            print("ファイル名が変更されました")
            return true
            
        } catch {
            
            //エラー処理
            print("ファイル名が変更されませんでした")
            return false
        }
    }
    
    /// ファイルの削除
    func removeFile( atPath: String) -> Bool {
        do {
            
            try FileManager.default.removeItem( atPath: atPath )
            print("ファイルが削除されました")
            return true
        } catch {
            
            //エラー処理
            print("ファイルが削除されませんでした")
            return false
        }
    }
    
    /// フォルダの作成
    func createDirectory( atDirectoryPath: String) -> Bool {
        do {
            
            try FileManager.default.createDirectory( atPath: atDirectoryPath, withIntermediateDirectories: true, attributes: nil)
            print("ディレクトリが作成されました")
            return true

        } catch {
            
            //エラー処理
            print("ディレクトリが作成されませんでした")
            return false
            
        }
    }
    
    /// フォルダの削除
    func removeDirectory( atDirectoryPath: String) -> Bool {
        do {
            
            try FileManager.default.removeItem( atPath: atDirectoryPath)
            print("ディレクトリが削除されました")
            return true
            
        } catch {
            
            //エラー処理
            print("ディレクトリが削除されませんでした")
            return false
            
        }
    }
}

