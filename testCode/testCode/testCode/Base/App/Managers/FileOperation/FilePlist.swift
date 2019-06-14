//
//  FilePlist.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/29.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import Foundation


// MARK: - Types
public enum FileOperationType {
    case file
    case directory
    
    public var message: String {
        switch self {
        case .file: return "ファイル"
        case .directory: return "ディレクトリ"
        }
    }
}
    
// MARK: - Types
public enum FileOperationStatus {
    case create
    case createSucceeded
    case createCreateFailed
    case exist
    case existed
    case notExist
    case copy
    case copySucceeded
    case copyFailed
    case change
    case changeSucceeded
    case changeFailed
    case delete
    case deleteSucceeded
    case deleteFailed
    
    public var message: String {
        switch self {
        case .create: return "作成"
        case .createSucceeded: return "作成されました"
        case .createCreateFailed: return "作成されませんでした"
        case .exist: return "存在"
        case .existed: return "ありました"
        case .notExist: return "ありませんでした"
        case .copy: return "コピー"
        case .copySucceeded: return "コピーされました"
        case .copyFailed: return "コピーされませんでした"
        case .change: return "変更"
        case .changeSucceeded: return "変更されました"
        case .changeFailed: return "変更されませんでした"
        case .delete: return "削除"
        case .deleteSucceeded: return "削除されました"
        case .deleteFailed: return "削除されませんでした"
        }
    }
    
    public var key: String {
        switch self {
        case .create: return "Create"
        case .createSucceeded: return "CreateSucceeded"
        case .createCreateFailed: return "CreateSucceeded"
        case .exist: return "Exist"
        case .existed: return "Existed"
        case .notExist: return "NotExist"
        case .copy: return "Copy"
        case .copySucceeded: return "CopySucceeded"
        case .copyFailed: return "CopyFailed"
        case .change: return "Change"
        case .changeSucceeded: return "ChangeSucceeded"
        case .changeFailed: return "ChangeFailed"
        case .delete: return "Change"
        case .deleteSucceeded: return "DeleteSucceeded"
        case .deleteFailed: return "DeleteFailed"
        }
    }
}

// MARK: - Types
public enum FilePlistType {
    case none
    case array
    case dictionary
    case empty

    public var message: String {
        switch self {
        case .none: return "指定がありません"
        case .array: return "配列"
        case .dictionary: return "連想配列"
        case .empty: return "空"
        }
    }
    
    public var key: String {
        switch self {
        case .none: return "None"
        case .array: return "Array"
        case .dictionary: return "Dictionary"
        case .empty: return "Empty"
        }
    }
}

class FilePlist: FileManager {
    //Managerクラスを作成しているのでinitは自動的に行われる
    //sharedManagerの中にManagerクラスのinit(インスタンス)が入っています。
    static let shared = FilePlist()
    var type: FilePlistType = .none
    
    // A 読取専用
    func openResource( fileName: String) -> Any?{
        var plist: NSDictionary = ["url":(Bundle.main.bundlePath + fileName)]
        var plistData: Any? = nil
        if let urls = Bundle.main.path(forResource: fileName , ofType:"plist" ) {
            
            if( self.fileExists( atPath: urls ) ) {
                
                print(self.message(type:.file, status: .existed))
                
                plistData = NSDictionary(contentsOfFile: urls)
                
                if plistData == nil {
                    plistData = NSArray(contentsOfFile: urls)
                    plist = [
                        "url":(Bundle.main.bundlePath + fileName),
                        "fileType":"Array",
                        "data":plistData!,
                    ]
                    self.type = .array
                } else {
                    if plistData != nil {
                        plist = [
                            "url":(Bundle.main.bundlePath + fileName),
                            "fileType":"Dictionary",
                            "data":plistData!,
                        ]
                    }
                    self.type = .dictionary
                }
            } else {
                
                print(self.message(type:.file, status: .notExist))
                
            }
        }
        return plist
    }
    
    private var plist:NSMutableDictionary
    
    override init() {
        self.plist = [:]
        super.init()
    }
    
    init( fileName: String?) {
        self.plist = [:]
        if let urls = Bundle.main.path(forResource: fileName , ofType:"plist" ) {
            if let plistData = NSDictionary(contentsOfFile: urls), let plist:NSMutableDictionary = plistData.mutableCopy() as? NSMutableDictionary {
                
                self.plist = plist
            }
            
        }
    }
    
    init( filePath: String?) {
        let fullFilePath = Bundle.main.path(forResource: filePath, ofType:nil)!
        let plist = NSMutableDictionary(contentsOfFile: fullFilePath)!
        self.plist = plist
    }
    
    // データを取得します。
    func get<T>(_ key:String) -> T {
        if self.plist.allKeys.count > 0 {
            return processing(self.plist.value(forKeyPath: key)) as! T
        }
        return T.self as! T
    }
    
    // get?としたかった。
    func want<T>(_ key:String) -> T? {
        if self.plist.allKeys.count > 0 {
            return processing(self.plist.value(forKeyPath: key)) as? T
        }
        return T.self as? T
    }
    
    // 共通加工処理
    private func processing<T>(_ value:T?) -> T? {
        // 例) 改行コードが入っている場合は改行する。
        if let str = value as? String {
            return str.replacingOccurrences(of: "¥n", with: "\n") as? T
        }
        return value
    }
    
    func anyDic (_ isDic:NSDictionary ) -> Any? {
        for p in isDic.allKeys {
            print(p)
            if let l = isDic[p] {
                switch l {
                case let object as Array<Any>:
                    return anyList(object as NSArray)
                case let object as Dictionary<AnyHashable, Any>:
                    return anyDic(object as NSDictionary)
                default:
                    print(l)
                    return l
                }
            }
        }
        return nil
    }
    
    func anyList (_ isList:NSArray) -> Any? {
        for p in isList {
            switch p {
            case let object as Array<Any>:
                return anyList(object as NSArray)
            case let object as Dictionary<AnyHashable, Any>:
                return anyDic(object as NSDictionary)
            default:
                print(p)
                return p
            }
        }
        return nil
    }
    
    func messageTest() {
        
        print(self.type.message as Any);
        
        let plist = FilePlist(fileName: "testDic")
        if plist.plist.allKeys.count > 0 {
            print(anyDic(plist.plist) as Any)
            let list:[String]? = plist.get("Foo.List")
            for l in list ?? [] {
                print(l)
            }
        }

        print(self.openResource(fileName: "SettingList") as Any)
        print(self.documentDirectoryFile(filePath: "SettingList.plist") as Any)
        print(self.bundleFile(resource: "SettingList",type: "plist") as Any)
        
        //存在確認
        if self.isFileExists(filePath: "SettingList.plist") {
            
        }
        //コピー処理
        if self.copyFiles(atPath: "SettingList.plist", toPath: "SettingList.plist") {
            
        }
        //ファイル名変更処理
        if self.moveFiles(atPath: "SettingList.plist", toPath: "SettingList2.plist") {
            
        }
        //ファイル削除
        if self.removeFile(atPath: "SettingList.plist") {
            
        }
        //ディレクトリー作成
        if self.createDirectory(atDirectoryPath: "Setting") {
            
        }
        //ディレクトリー削除
        if self.removeDirectory(atDirectoryPath: "Setting") {
            
        }
        
        if self.writeResource(resourcePlist: "sample.plist", putData: ["sample":[:]]) {
            print(self.openResource(resourcePlist: "sample.plist")!)
            let filePath = self.documentDirectoryFile(filePath: "sample.plist")!
            if self.isFileExists(filePath: self.documentDirectoryFile(filePath: "sample.plist")!) {
                if self.removeFile(atPath: filePath) {
                    print(self.openResource(resourcePlist: "sample.plist") as Any)
                }
            }
        }
    }
}

extension FileManager {
    
    // 単体のモジュール定数（publicを付けるとグローバル定数）
    func message( type: FileOperationType, status:FileOperationStatus) -> String {
        return type.message + "が" + status.message
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
            
            print(FilePlist.shared.message(type:.file, status: .existed))
            
            let filePath = dir.appendingPathComponent( filePath )
            path = filePath.path
            print(path!)
        } else {
            
            print(FilePlist.shared.message(type:.file, status: .notExist))
            
        }
        return path
    }
    
    /// アプリにバンドルされているファイルを取得
    func bundleFile( resource: String, type: String) -> String? {
        if let path: String = Bundle.main.path( forResource: resource, ofType: type ) {

            print(FilePlist.shared.message(type:.file, status: .existed))
            print(path)
            return path
        } else {
            
            print(FilePlist.shared.message(type:.file, status: .notExist))
            
        }
        return nil
    }
    
    /// ファイルの存在確認
    func isFileExists(filePath:String) -> Bool {
        if( FileManager.default.fileExists( atPath: filePath ) ) {
            
            print(FilePlist.shared.message(type:.file, status: .existed))
            
            return true
        } else {
            
            print(FilePlist.shared.message(type:.file, status: .notExist))
            
        }
        return false
    }
    
    /// ファイルのコピー
    func copyFiles( atPath: String, toPath: String ) -> Bool {
        do {
            
            try FileManager.default.copyItem( atPath: atPath, toPath: toPath )
            
            print(FilePlist.shared.message(type:.file, status: .copySucceeded))
            return true
        } catch {
            
            //エラー処理
            print(FilePlist.shared.message(type:.file, status: .copyFailed))
            return false
        }
    }
    
    /// ファイル名の変更（ファイルの移動）
    func moveFiles( atPath: String, toPath: String ) -> Bool {
        do {
            
            try FileManager.default.moveItem( atPath: atPath, toPath: toPath )
            print(FilePlist.shared.message(type:.file, status: .changeSucceeded))
            return true
            
        } catch {
            
            //エラー処理
            print(FilePlist.shared.message(type:.file, status: .changeFailed))
            return false
        }
    }
    
    /// ファイルの削除
    func removeFile( atPath: String) -> Bool {
        do {
            
            try FileManager.default.removeItem( atPath: atPath )
            print(FilePlist.shared.message(type:.file, status: .deleteSucceeded))
            return true
        } catch {
            
            //エラー処理
            print(FilePlist.shared.message(type:.file, status: .deleteFailed))
            return false
        }
    }
    
    /// フォルダの作成
    func createDirectory( atDirectoryPath: String) -> Bool {
        do {
            
            try FileManager.default.createDirectory( atPath: atDirectoryPath, withIntermediateDirectories: true, attributes: nil)
            print(FilePlist.shared.message(type:.directory, status: .createSucceeded))
            return true
            
        } catch {
            
            //エラー処理
            print(FilePlist.shared.message(type:.directory, status: .createCreateFailed))
            return false
            
        }
    }
    
    /// フォルダの削除
    func removeDirectory( atDirectoryPath: String) -> Bool {
        do {
            
            try FileManager.default.removeItem( atPath: atDirectoryPath)
            print(FilePlist.shared.message(type:.directory, status: .deleteSucceeded))
            return true
            
        } catch {
            
            //エラー処理
            print(FilePlist.shared.message(type:.directory, status: .deleteFailed))
            return false
            
        }
    }
}
