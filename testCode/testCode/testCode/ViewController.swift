//
//  ViewController.swift
//  testCode
//
//  Created by YouOhshima on 2019/05/15.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import UIKit

/*
 * @testable
 * モジュールのimport宣言に対し、internal以上のアクセスレベルで公開されているメソッドやプロパティに対しテストクラスがアクセス可能なことを宣言します
 */
@testable import AddressBookUI


@IBDesignable class Swift4CustomButton:UIButton {
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable
    public var backgroundHexColor: String = "FF0000" {
        didSet {
            self.backgroundColor = UIColor.init(hex: self.backgroundHexColor)
        }
    }
}

@IBDesignable class ViewController: UIViewController {
    @IBOutlet weak var openButton: Swift4CustomButton!
    var timetable: Dictionary<AnyHashable, Any>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /************
         * Swift4の変更に伴って
         ************/
        NSLog( "%@",UserDefaults.standard.volatileDomainNames )
        print("input")
        timetable = [:]
        for i in 1..<10 {
            let updateString = "OK"
            if var tt: Dictionary<AnyHashable, Any> = timetable {
                tt.updateValue(updateString, forKey: "_\(i)")
                print( tt["_\(i)"]!)
                timetable = tt
            }
        }
        print("display")
        for i in 1..<10 {
            if var tt: Dictionary<AnyHashable, Any> = timetable {
                print( tt["_\(i)"]!)
            }
        }
        if var tt: Dictionary<AnyHashable?, Any?> = timetable {
            timetable = (tt as! Dictionary<AnyHashable, Any>)
            for (key,value) in tt {
                if let _key = key,let _value = value,let _data = tt[_key] as? String {
                    print("data: \(_key):\(_value):\(_data)")
                }
            }
            timetable = (tt as! Dictionary<AnyHashable, Any>)
            
            for i in 1..<5 {
                if tt.isEmpty { break }
                if var dt: Dictionary<AnyHashable, Any> = timetable {
                    dt.removeValue(forKey: "_\(i)")
                    print("timetable : _\(i) 削除されました")
                    print(dt)
                    tt = dt
                    timetable = (tt as! Dictionary<AnyHashable, Any>)
                }
                if tt.isEmpty { break }
            }
            // 全削除
            tt.removeAll()

            if tt.isEmpty {
                timetable = nil
                print("timetable : {空}")
            } else {
                print("timetable : ")
                print(timetable!)
                print(timetable!.capacity)
                print(timetable!.isEmpty)
            }
        }
        
        var dictionary:[String:Int] = ["one": 1, "two": 2, "three": 3]  // ["one": 1, "two": 2, "three": 3]
        dictionary["one"] = nil                               // ["two": 2, "three": 3]
        //削除する値を取得したい場合は、removeValueForKeyを利用します。
        let previousValue = dictionary.removeValue( forKey: "two" )
        print(dictionary)      // ["three": 3]
        // print(previousValue)   // Optional(2)
        if let p = previousValue {
            myUnwrappedName(name: p.description)
        }
        
        let defaultVals: [String : Any] = [
            "Ruby" : 1,
            "Python" : 2,
        ]
        
        var optionVals: [String : Any] = [
            "Ruby" : "rails",
            "PHP" : "laravel",
        ]
        
        
        optionVals.merge(defaultVals) { optionValue , defaultValue in
            return optionValue
        }
        
        print(optionVals)
        
        let dic = ["Ruby": 3, "PHP": 2, "Python": 1]
        
        // mapValuesで、Valueを2倍にする
        let mapped = dic.mapValues { $0 + 2 }
        
        print(mapped)
        
        var fruits = ["apple", "orange", "pineapple", "banana", "strawberry", "cherry"]
        fruits.swapAt(1, 3)
        print(fruits)
        
        let dic_default = ["hoge": 1, "figa": 2, "piyo": 3]
        let dic_default_piyo = dic_default["piyo", default: 0]
        
        print(dic_default_piyo)
        
        let prefectures = [
            "北海道",
            "青森県",
            "岩手県",
            "宮城県",
            "秋田県",
            "山形県",
            "福島県",
            "茨城県",
            "栃木県",
            "群馬県",
            "埼玉県",
            "千葉県",
            "東京都",
            "神奈川県",
            "新潟県",
            "富山県",
            "石川県",
            "福井県",
            "山梨県",
            "長野県",
            "岐阜県",
            "静岡県",
            "愛知県",
            "三重県",
            "滋賀県",
            "京都府",
            "大阪府",
            "兵庫県",
            "奈良県",
            "和歌山県",
            "鳥取県",
            "島根県",
            "岡山県",
            "広島県",
            "山口県",
            "徳島県",
            "香川県",
            "愛媛県",
            "高知県",
            "福岡県",
            "佐賀県",
            "長崎県",
            "熊本県",
            "大分県",
            "宮崎県",
            "鹿児島県",
            "沖縄県",
        ]
        
        let dic_prefectures = Dictionary(uniqueKeysWithValues: zip(1..., prefectures))
        
        print(dic_prefectures)
        
        enum ProfileType: String {
            case president = "社長"
            case director = "部長"
            case chief_manager = "係長"
            case usually = "社員"
        }
        
        struct HistroicalPerson : CustomStringConvertible {
            let name: String
            let type: ProfileType
            
            var description: String {
                return name
            }
        }
        
        let persons = [
            HistroicalPerson(name: "織田信長", type: .president),
            HistroicalPerson(name: "坂本龍馬", type: .chief_manager),
            HistroicalPerson(name: "聖徳太子", type: .chief_manager),
            HistroicalPerson(name: "豊臣秀吉", type: .president),
            HistroicalPerson(name: "西郷隆盛", type: .director),
            HistroicalPerson(name: "中臣鎌足", type: .usually),
            HistroicalPerson(name: "徳川家康", type: .president),
        ]
        
        let grouped = Dictionary(grouping: persons, by: { $0.type.rawValue })
        print(grouped)
        
        /*************
         *
         * Reduceの強化
         *
        **************/
        
        // 1から9までの数字を全部足した数を求める
        let sum = [1, 2, 3, 4, 5, 6, 7, 8, 9].reduce(0) { result, number in
            return result + number
        }
        print(sum) // 45
        
        // もう少しシンプルに書くとこんな感じ
        let reduce_sum = (1...9).reduce(0) { $0 + $1 }
        print(reduce_sum) // 45
        
        var num1: Int?// 宣言した時点ではnil
        num1 = 10
        print(num1) // → "Optional(10)"
        if let wrap_num1 = num1 {
            print(wrap_num1) // → "10"
            let num2 = wrap_num1 + 10 // ← エラー
            print(num2) // → "Optional(10)"
        }

        let str1: String? = """
H
E
L
L
O
"""
        let str2 = str1?.lowercased() // オプショナルチェイニングに変更
        if let wrap_str2 = str2 {
            print("str2 : Optional")
            print(str2) // → Optional("hello")
            print("wrap_str2 : ")
            print(wrap_str2) // → hello
        }
        myUnwrappedName(name: str1)
        
        let size: Int? = str1?.uppercased().count
        let default_size = 10
        let yourSize = size ?? default_size // （1）sizeがnilの場合には1
        // print(yourSize) // →

        myUnwrappedName(name: yourSize.description)
        
        /***********************
         * 数値比較
         *
         * Swiftは型に厳しい言語ではありますが、Swift 4では整数の数値比較については型の厳しさが緩まりました。
         * 例えば、下記のような比較はSwift 3ではすべてコンパイラがエラーで弾いていましたが、Swift 4では通ります。これは整数型のプロトコル周りの関係性などが見直されたことに起因するそうです。
         *
         ***********************/
        //Swift4
        let iVal: Int = 10
        let i32Val : Int32 = 10
        let uiVal : UInt = 10
        let ui16Val: UInt16 = 10
        let ui32Val: UInt32 = 10
        
        if ui16Val == ui32Val {
            print("equal!")
        }
        
        if iVal == uiVal {
            print("equal!")
        }
        
        if iVal == i32Val {
            print("equal!")
        }
        
        if i32Val == ui16Val {
            print("equal!")
        }
        
        /***********************
         *
         * 文字列(String)の強化
         *
         * コレクション化
         *
         * Swift 3で打ち切られていた「文字列のコレクション化」が復活しました。つまり、String でも map() や forEach() などの機能が使えるということです。
         *
         ***********************/
        // 1文字ずつ配列にしちゃう
        print("Hello World".map {
            String($0)
        })
        
        "SAMURAI".forEach{
            //  一文字ずつ取り出し、データとして取得できる
            print($0)
        }
        
        /***********************
         *
         * 文字列長の取得
         *
         * 文字列のコレクション化に伴って、文字列の長さはcountプロパティで取得できるようになります。
         *
         * 今まではStringを構成するcharactersの要素数で判定する方法（(ちなみに、この方法は不正確なので注意）などが取られていましたが、String自身のカウントをするだけで事足りるように強化されました。
         ***********************/
        // iOS 10以降を要求
        
        #if swift(>=4.2)
            // Swift 4 では
            print("Hello World".count) // → 11
        #else
            // Swift 3 では
            print("Hello World".characters.count) // → 11
        #endif
        
        
        
        let str = "Hello Samurai-Engineer."
        let hyphen = str.index(of: "-")!
        let dot   = str.index(of: ".")!
        let space = str.index(of: " ")!
        
        print(str[..<hyphen]) // "Hello Samurai"
        print(str[..<dot])   // "Hello Samurai-Engineer"
        print(str[..<space]) // "Hello"

        struct Weapon {
            let name: String
            let strength: Int
        }
        
        struct Hero {
            let name: String
            let hitPoint: Int
            let magicPoint: Int
            let weapons: [Weapon]
        }
        
        struct Enemy {
            let name: String
            let hitPoint: Int
        }
        
        
        let steelSword = Weapon(name: "鋼の剣", strength: 20)
        let yoshihiko = Hero(name: "勇者ヨシヒコ", hitPoint: 90, magicPoint: 12, weapons: [steelSword])
        print(yoshihiko.name) // "勇者ヨシヒコ"
        print(yoshihiko.weapons.first!.name) // "鋼の剣"
        
        class PlayerHero: NSObject {
            let name: String
            @objc dynamic var hitPoint: Int
            
            init(name: String, hitPoint: Int) {
                self.name = name
                self.hitPoint = hitPoint
                super.init()
            }
        }
        
        class MonsterEnemy: NSObject {
            let name: String
            @objc dynamic var hitPoint: Int
            
            init(name: String, hitPoint: Int) {
                self.name = name
                self.hitPoint = hitPoint
                super.init()
            }
            
            func attack(to hero: PlayerHero) {
                hero.hitPoint -= 5
            }
        }
        
        let player_yoshihiko = PlayerHero(name: "勇者ヨシヒコ", hitPoint: 90)
        let enemy_slime = MonsterEnemy(name: "スライム", hitPoint: 10)
        /*
         player_yoshihiko.observe(Hero.hitPoint, options: [.old, .new]) { me, change in
         let diff = (change.newValue ?? 0) - (change.oldValue ?? 0)
         let isDamaged = diff < 0
         print("(me.name)は、HPを(abs(diff))(isDamaged ? "消費した" : "回復した" )")
         }
        */

        // スライムの攻撃!
        enemy_slime.attack(to: player_yoshihiko)
        // "勇者ヨシヒコは、HPを5消費した"と出力される
        
        
        /***
         * クロージャーの設定の仕方
         * @autoclosure
         */
        // 呼び出し部分
        someClosureMethod(closure: 10)
        
        errorSomeAsyncMethod {
            print("someAsyncMethod")
        }
        someAsyncMethod(completion: {
            print("someAsyncMethod")
        })
        
        someMethodForObjc()
        SomeMethodForSwift()
        
        MyObjectiveClass().foo()
        MyObjectiveClass().bar()
        MyObjectiveClass().baz()
        MySubObjvtiveClass().wibble()
        MySubObjvtiveClass().wobble()
        /*
         error
        if managerdName != nil {
            print(managerdName)
        }
        */
    }
    
    /* @NSCopying
     * ストアドプロパティのセッターでコピーした値をセットします
     * Objective-Cのcopy属性と同様
     * Swift4でイニシャライザでの挙動が改善されました（Proposal: SE-0153）
     */
    // @NSCopying var copyingfoo: NSCopying

    /**
     * @NSManaged
     *クラスのインスタンスメソッドやストアドプロパティに対し、CoreDataで実行時に動的に実装が生成されることを宣言します
     */
    @NSManaged var managerdName: String
    
    
    func myUnwrappedName(name: String?) {
        guard let unwrappedName = name else { return }
        // 引数がnilでない場合の処理
        print("unwrappedName : ")
        print(unwrappedName) // →
    }
    
    // 定義部分
    // Swift4 @autoclosure クロージャーの設定
    func someClosureMethod(closure: @autoclosure () -> Int) {
        print(closure())
    }
    //public static func &&(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool
    //public static func ||(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool
    
    /**
     * @escaping
     * クロージャをスコープ外でも保持する必要があることを示します
     *   以下の例では、completionクロージャーの実行を非同期で実行しているため、スコープ外ではクロージャーが保持されず、コンパイルエラーとなります
    */
    // NG: コンパイルエラー
    func errorSomeAsyncMethod(completion: () -> Void) {
        DispatchQueue.main.async {
            // completion()
        }
    }
    
    // OK
    func someAsyncMethod(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
    
    /**
     * @objc
     * Objective-Cから使用できることを明示的に宣言します
     * extensionに指定すると全てのメンバに一括で指定できます
     * @objc(引数)でObjective-Cで使いたい名前を指定できます
     Swift4以前ではNSObjectを継承したクラスやdynamicでは暗黙的に@objcが付け加えられていましたが、Swift4では付与されなくなりました（Proposal: SE-0160）
     **/
    
    // someMethodとしてObjective-Cから利用可能
    @objc(someMethodObjective)
    func someMethodForObjc() {
        print("someMethodとしてObjective-Cから利用可能")
    }

    /**
     * @nonobjc
     * Objective-Cから使用できないことを明示的に宣言します
     * extensionに指定すると全てのメンバに一括で指定できます
     */
    
    @nonobjc
    func SomeMethodForSwift() {
        print("Objective-Cから使用できない")
        
    }
    
    /**
     * @IBOutlet
     * プロパティがInterfaceBuilder（StoryBoard）に配置したパーツに紐づけられることを示します
     * 暗黙的に@objcが付け加えられます
     */
    @IBOutlet weak var swift4detailDescriptionLabel: UILabel!
    
    /**
     * @IBAction
     * メソッドがInterfaceBuilder（StoryBoard）に配置したパーツのアクションに紐付けられることを示します
     * 暗黙的に@objcが付け加えられます
     **/
    
    @IBAction func swift4ButtonTapped() {
        print("@IBAction")
    }

}

/**
 * @IBDesignable
 * UIViewまたはNSViewを継承したカスタムクラスに指定するとデザインやサブビューがInterfaceBuilder（StoryBoard）上でライブレンダリングされます
 * 暗黙的に@objcが付け加えられます
 */
@IBDesignable class Swift4CustomView: UIView {
    
    /**
     * @IBInspectable
     * プロパティに指定すると、InterfaceBuilder（StoryBoard）のAttribute Inspectorで設定でき、ライブレンダリングでデザインを確認できます
     * 対応する型（Int, CGFloat, Double, String, Bool, CGPoint, CGSize, CGRect, UIColor, UIImage）
     * 暗黙的に@objcが付け加えられます
     **/
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}
/*
 @objcMembers
 クラス全体に対し一括でObjective-Cから使用できることを明示的に宣言します
 @objcMembersを付与したクラスのサブクラスやエクステンションにも影響します。
 Swift4で導入（Proposal: SE-0160）
 例
 */
@objcMembers
class MyObjectiveClass : NSObject {
    // @objcになる
    func foo() {
        print("@objcになる")
        
    }
    
    // @objcにならない（タプルを返しているため）
    func bar() -> (Int, Int) {
        print("@objcにならない")
        return (1, 1)
        
    }
}

extension MyObjectiveClass {
    // @objcになる
    func baz() {
        print("@objcになる")
        
    }
}

class MySubObjvtiveClass : MyObjectiveClass {
    // @objcになる
    func wibble() {
        print("@objcになる")
        
    }
}

extension MySubObjvtiveClass {
    // @objcになる
    func wobble() {
        print("@objcになる")
    }
}

/*
 * @GKInspectable
 * カスタムのGameplayKitコンポーネントプロパティをSpriteKitエディタのUIに公開します
 * 暗黙的に@objcが付け加えられる
 */
/*
 GKComponent
class MyComponent: GKComponent {
    @GKInspectable var speed: Float = 1.0
    @GKInspectable var friction: Float = 2.0
}
 */

/**
 *
 * @UIApplicationMain
 * アプリケーションデリゲートであることを示します（iOSアプリ用）
 * この属性がない場合はmain.swiftを用意し、UIApplicationMain(::_:)関数を利用してデリゲート設定を行います
 */

/**
 * @NSApplicationMain
 * アプリケーションデリゲートであることを示します（macアプリ用）
 この属性がない場合はmain.swiftを用意し、UIApplicationMain(::_:)関数を利用してデリゲート設定を行います
 */

/*
 * @NSKeyedArchiverClassName
 * クラスに対し、インスタンスをアーカイブする際にNSKeyedArchiverやNSKeyedUnarchiverで利用される名前を指定します
 */

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
