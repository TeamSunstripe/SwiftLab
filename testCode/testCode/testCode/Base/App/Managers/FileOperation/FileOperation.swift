//
//  FileOperation.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/29.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import Foundation

class FileOperation {
    //Managerクラスを作成しているのでinitは自動的に行われる
    //sharedManagerの中にManagerクラスのinit(インスタンス)が入っています。
    static let shared = FileOperation()
    
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
