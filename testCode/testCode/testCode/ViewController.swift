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
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var enemyImageView: UIImageView!
    
    var timetable: Dictionary<AnyHashable, Any>?
    
    var playerHeros: [PlayerHero?] = [] // 味方
    var steelSword = Weapon(name: "鋼の剣", strength: 20)
    var enemySlimes: [MonsterEnemy?] = [] // 敵
    var observation:NSKeyValueObservation? = nil
    
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
        /*
        if var tt: Dictionary<AnyHashable, Any> = timetable {
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
         */

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
        
        struct Hero_ {
            let name: String
            let hitPoint: Int
            let magicPoint: Int
            let weapon: Weapon
        }
        
        struct Enemy {
            let name: String
            let hitPoint: Int
        }
        
        steelSword = Weapon(name: "鋼の剣", strength: 20)
        let yoshihiko = Hero(name: "勇者ヨシヒコ", hitPoint: 90, magicPoint: 12, weapons: [steelSword], items: [])
        
        print(yoshihiko[keyPath: \Hero.name]) // "勇者ヨシヒコ"
        print(yoshihiko[keyPath: \Hero.weapons.first!.name]) // "鋼の剣"
        
        playerHeros = [PlayerHero(name: "勇者ヨシヒコ",urlString: "https://image.showroom-live.com/showroom-prod/image/avatar/1018274.png", hitPoint: 90)]
        
        enemySlimes = [MonsterEnemy(name: "スライム",urlString: "https://camo.qiitausercontent.com/d78e2729745400d7bc4e3b93e268231c3a3488da/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3233323731352f65633738636139302d666461392d653035322d353464372d3331323231333761356365332e706e67", hitPoint: 10)]
        
        if !enemySlimes.isEmpty, let enemySlime = enemySlimes.first,let enemy_slime :MonsterEnemy = enemySlime,!playerHeros.isEmpty, let playerHero = playerHeros.first,let player_hero:PlayerHero = playerHero {
            
            player_hero.hero.weapons = [steelSword]
            
            //モンスター
            monsterImage(imageView: enemyImageView, URLString: enemy_slime.URLString)
            // 監視オブジェクトを保持する
            enemy_slime.damaged = enemy_slime.observe(\.hitPoint, options: [.new,.old], changeHandler: { me,change in
                let diff = (change.newValue ?? 0) - (change.oldValue ?? 0)
                let isDamaged = diff < 0
                if me.hitPoint > 0 {
                    print("\(me.name)::HP(\(me.hitPoint))は、HPを\(abs(diff))\(isDamaged ? "消費した" : "回復した")")
                } else {
                    if !self.enemyImageView.isHidden {
                        print("\(me.name)は死亡した")
                        player_hero.getItem(item: (me.die() ) )
                        
                        UIView.animate(withDuration: 3.0, delay: 2.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                            self.enemyImageView.alpha = 0.0
                        }, completion: { finished in
                            if finished {
                                self.enemyImageView.isHidden = true
                            }
                        })
                        
                    } else {
                        
                    }
                }
            })
            
            monsterImage(imageView: playerImageView, URLString: player_hero.URLString)
            // 監視オブジェクトを保持する
            player_hero.damaged = player_hero.observe(\.hitPoint, options: [.new,.old], changeHandler: { me,change in
                let diff = (change.newValue ?? 0) - (change.oldValue ?? 0)
                let isDamaged = diff < 0
                if me.hitPoint > 0 {
                    print("\(me.name)::HP(\(me.hitPoint))は、HPを\(abs(diff))\(isDamaged ? "消費した" : "回復した")")
                } else {
                    if !self.playerImageView.isHidden {
                        print("\(me.name)は死亡した")
                        UIView.animate(withDuration: 3.0, delay: 2.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                            self.playerImageView.alpha = 0.0
                        }, completion: { finished in
                            if finished {
                                self.playerImageView.isHidden = true
                            }
                        })
                        
                    } else {
                        
                    }
                }
            })
        }
        
        let steelSword1 = Weapon(name: "鋼の剣", strength: 20)
        let yoshihiko1 = Hero_(name: "勇者ヨシヒコ", hitPoint: 90, magicPoint: 12, weapon: steelSword1)
        
        let keyPath1 = \Hero_.weapon
        let keyPath2 = keyPath1.appending(path: \Weapon.name)// 名前(name)を追加
        
        print(yoshihiko1[keyPath: keyPath1]) // "Weapon(name: "鋼の剣", strength: 20)"
        print(yoshihiko1[keyPath: keyPath2]) // "鋼の剣"
        
        /**/
        /**
         *   はじめに
         *   Swiftとオブジェクト間の通知のパターンについて考えてみます。
         *   「オブジェクト間の通知」とはオブジェクト間のメッセージのやりとりを意味します。
         *    iOSアプリ開発では複数のオブジェクトを扱うため、その通知方法の設計は疎かにはできません。アプリの規模が大きくなるにつれて、コードの重複を避け、再利用のためにコードを責務（役割）に応じて分割する必要があります。例えば、View（UI）とModel（ビジネスロジック）を分けた場合、Modelのデータ更新の完了をViewへどのように通知したらよいでしょうか。
         **/
        
        /***
         ※  概要
         ※  本記事ではアンチパターンを含めた以下の6つの通知パターンを説明します。最後に、それぞれのパターンの比較と使い分けについて説明します。
         
         ※   循環参照パターン（アンチパターン）
         ※   Delegateパターン（弱参照+ポリモーフィズム）
         ※   NotificationCenterパターン
         ※   KVO（Key-Value Observing: キー値監視）パターン
         ※   Closure Callbackパターン
         ※   Data Bindingパターン（プロパティオブザーバ+Closure）
         ※ これら以外にもRxSwiftやBondなど、OSSを用いた通知のパターンもありますが本記事の内容には含まれません。
         ***/
        
        self.view.backgroundColor = UIColor.init(hexRGBA: "FFFFFF88");
        openButton.backgroundColor = UIColor.loginButtonColor()
        
    }
    
    @IBAction func slimeAttack(_ sender: Any) {
        if !enemySlimes.isEmpty, let enemySlime = enemySlimes.first,let enemy_slime = enemySlime,!playerHeros.isEmpty, let playerHero = playerHeros.first,let player_hero = playerHero {
            print("\(enemy_slime.name)の攻撃!")
            // スライムの攻撃!
            enemy_slime.attack(to: player_hero,from: enemy_slime)
            // "勇者ヨシヒコは、HPを5消費した"と出力される
        } else {
            print(enemySlimes)
            let enemySlime = enemySlimes.first
            print(enemySlime)
            print("何も起こらなかった")
        }
    }
    
    @IBAction func heroAttack(_ sender: Any) {
        if !enemySlimes.isEmpty, let enemySlime = enemySlimes.first,let enemy_slime = enemySlime,!playerHeros.isEmpty, let playerHero = playerHeros.first,let player_hero = playerHero {
            print("\(player_hero.name)の攻撃!")
            // 勇者ヨシヒコの攻撃!
            player_hero.attack(to: enemy_slime,from: player_hero)
            // "勇者ヨシヒコは、HPを5消費した"と出力される
        } else {
            print(enemySlimes)
            let enemySlime = enemySlimes.first
            print(enemySlime)
            print("何も起こらなかった")
        }
    }
    
    func monsterImage(imageView: UIImageView,URLString: String) {
        //http://livedoor.blogimg.jp/amosaic/imgs/4/3/4360becd.jpg
        let imageURLString:String? = URLString
        
        if let URLString = imageURLString {
            let url = URL(string: URLString)
            do {
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data)
                imageView.image = image
                
            } catch let err {
                print("Error : \(err.localizedDescription)")
            }
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data!)
                }
            }).resume()
        }
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

/***
 * 6つの通知パターン
 * 1. 循環参照パターン（アンチパターン）
 * はじめに、やってはダメなアンチパターンについて触れておきます。シンプルに考えると、通知のために別オブジェクトのメソッドを実行するには、そのオブジェクトの参照を持っていれば良いということになります。そのため、オブジェクト間で相互にやりとりをするにはお互いの参照を持っていれば良いことになります。
 *
 * 循環参照パターンのソースコード例は以下のようになります。
 *
 * 循環参照パターン
 ***/

import UIKit

class NotificationView:View {
    // ★ Modelオブジェクトへの参照
    var modelNotification: NotificationModel = NotificationModel()
    
    // 1. UIイベントの発生
    override func receiveUIEvent() {
        modelNotification.view = self
        
        // 2. データの更新をModelに通知
        modelNotification.updateData()
    }
    
    // 5. UIの更新
    override func updateUI() {
        print("\(modelNotification.data)")
    }
}

class NotificationModel {
    // ★ Viewオブジェクトへの参照
    var view: NotificationView?
    var data: Int = 0
    
    // 3. データの更新
    func updateData() {
        data += 1
        
        // 4. Viewへデータの更新完了を通知
        view?.updateUI()
        let view = View()
        view.receiveUIEvent()
    }
}

/**
 *
 * こちらのソースコードは正常に動作しますが、「循環参照」(strong reference cycle)という問題を抱えています。オブジェクトがお互いに参照を持つ状態になった場合、参照関係が循環していると言えます。循環参照になった場合、オブジェクトはメモリから解放されなくなってしまいます。この状態をメモリリークと言います。メモリリークが増えるとパフォーマンスが落ち、最悪アプリがクラッシュするため、このパターンを採用すべきではありません。
 *
 * ＜補足: iOSのメモリ管理方式について＞
 * iOSではメモリ管理を参照カウンタ(Reference Counting)という方式で行っています。オブジェクトへの参照を持つごとに参照カウンタを+1し、オブジェクトへの参照がなくなった時点で-1します。つまりどのオブジェクトも参照していない場合、参照カウンタが0になるため、OSはそのオブジェクトをメモリから開放しても良いと判断します。ARC（自動参照カウンタ）の採用により、iOS5以降ではプログラマがメモリ管理を意識することは減りましたが、循環参照には気をつける必要があります。
 *
 * 2. Delegateパターン（弱参照+ポリモーフィズム）
 * 次に紹介するのはパターン1の改良版です。Swiftではプロパティにweakキーワードをつけることで、「弱参照」（weak reference）することができます。弱参照の場合は通常の「強参照」と異なり、先に説明した参照カウンタが増えません。つまり循環参照の問題が解決します。弱参照のプロパティでは参照先のオブジェクトが解放され、nilが代入される可能性があるため、オプショナル型で定義する必要があります。
 
 * Viewオブジェクトへの参照を弱参照にする
 * // weakキーワードで弱参照
 * weak var view: View?
 * これで循環参照の問題は解決しました。しかしこのパターンにはさらに改良の余地があります。それはViewとModelが「密結合」であるという点です。密結合な設計は変更に弱く、再利用もしづらいと言えます。ここで言う変更に弱いというのは、仕様変更が入った場合に変更箇所が多くなるという意味です。
 *
 * 例えば、ViewでなくSecondViewがModelを使うよう仕様変更が入ったとします。Modelのクラス内にはViewが書かれているため、これを修正しないとSecondViewからは利用できません。「ModelはViewに依存している」とも言えます。
 *
 */

//Modelの仕様変更
class testModel {
    // View → SecondViewに変更が必要
    weak var view: View?
    var data: Int = 0
    func updateData() {
        data += 1
        view?.updateUI()
    }
}
/***
 * この問題を解決するには、ModelがViewに依存しない書き方にする必要があります。具体的には、ModelがViewに依存するのではなく、より抽象的なインタフェースに依存させるようにします。Modelが必要とする抽象的なインタフェースとは何でしょうか？
 *
 * それは「updateUIメソッドが実行できること」のみです。updateUIメソッドが実行できるクラスであればViewでなくともSecondViewでもどんなクラスでも良いということになります。この抽象的なインタフェースを表す方法の1つとして、Swiftではプロトコルがあります。プロトコルはJavaにおけるinterfaceに近い概念です。
 
 * updateUIメソッドを持つという概念をプロトコルで実装すると以下のようになります。
 
 ***/
/***
 * プロトコルの例
 */
protocol SampleViewProtocol {
    func updateUI()
}

/*プロトコルはインスタンス化することはできません。しかし型として扱えるため、Modelクラスの実装を以下のように書くことができます。*/

/**
 * ModelをSampleViewProtocolに依存させる
 */

// ViewProtocolに準拠することを宣言
class View: SampleViewProtocol {
    var model: SampleViewProtocolModel = SampleViewProtocolModel()
    
    func receiveUIEvent() {
        model.view = self
        model.updateData()
    }
    
    // ViewProtocolに準拠したメソッド
    func updateUI() {
        print("\(model.data)")
    }
}

protocol ViewProtocol: class {
    func updateUI()
}

class SampleViewProtocolModel {
    // ViewでなくViewProtocolに依存
    weak var view: View?
    var data: Int = 0
    func updateData() {
        data += 1
        view?.updateUI()
    }
}

/***
 * これでModelがViewに依存しないコードになりました。これは「ポリモーフィズム」の一例にもなっています。ポリモーフィズム（polymorphism: 多態性）は、動的にメソッドによって呼び出されるオブジェクトが変わり、そのオブジェクトによって振る舞いが変わるという性質です。今回の例では、Modelはviewプロパティに対しupdateUIメソッドを実行していますが、viewプロパティがViewなのかSecondViewなのかは分かりません。しかし、実行されるオブジェクトによってupdateUIメソッドの実装は異なり、振る舞いが変化します。
 *
 * UIKitフレームワークではUITableViewDelegateプロトコルなど、多くのオブジェクトでこのデリゲートパターンが採用されています。デリゲートパターンにおけるポリモーフィズムの性質を活かすことで、再利用性の高いUI部品が提供されています。
 */

// ＜補足: プロトコルのclass継承について＞

// プロトコルのclass継承
protocol classViewProtocol: class {
    func updateUI()
}

/***
 * 上記のコード例では、ViewProtocolはclassを継承させています。classを継承すると、そのプロトコルはクラスにしか適用できなくなります。先に説明したように、Modelのviewプロパティはweak（弱参照）で定義されているため、クラス（参照型）である必要があります。クラス以外の構造体や列挙体は値型であるため、weakを利用できません。そのため、ViewProtocolがクラス（参照型）であることを明示するためにclassを継承する必要があります。
 *
 ***/
class protocolModel {
    // weakがついているのでViewProtocolは参照型である必要がある
    weak var view: ViewProtocol?
    
}
/*
 * 3. NotificationCenterパターン
 次にNotificationCenterクラスを利用した通知のパターンを説明します。NotificationCenterは受信登録したオブジェクトに対し情報をブロードキャストします。また、同じ通知名を別のオブジェクトからも送信できるため、多対多の通知を実現できます。
 
 * NotificationCenterは以下のように利用できます。通知名はNotification.Nameをextensionで拡張し、staticプロパティで定義しておくと利用しやすいです。
 */

/*** NotificationCenterの使い方 ***/
// 通知名を登録
extension Notification {
   static let updateDataNotification = Notification.Name("updateDataNotification")
}

/*
 //　通知の受信登録（updateDataNotificationの通知を受信したら、updateUIメソッドを実行）
 NotificationCenter.default.addObserver(self,
 selector: #selector(updateUI),
 name: .updateDataNotification,
 object: nil)
 
 // 通知の送信（updateDataNotificationの通知を送信）
 NotificationCenter.default.post(name: .updateDataNotification,
 object: nil)
 NotificationCenterを利用した場合のModelからViewへ通知する例は以下のようになります。
 */

/***
 * NotificationCenterパターン
 ***/

// 通知名を登録
// TODD:既にあるのでコメントアウト
// extension Notification.Name {
//    static let updateDataNotification = Notification.Name("updateDataNotification")
//}

class sampleModeView {
    var model: SampleModel = SampleModel()
    
    init() {
        // 通知の受信登録（updateDataNotificationの通知を受信したら、updateUIメソッドを実行）
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateUI),
                                               name: Notification.updateDataNotification,
                                               object: nil)
    }
    
    func receiveUIEvent() {
        model.updateData()
    }
    
    @objc func updateUI() {
        print("\(model.data)")
    }
}

class SampleModel {
    var data: Int = 0
    func updateData() {
        data += 1
        
        // 通知の送信（updateDataNotificationの通知を送信）
        NotificationCenter.default.post(name: Notification.updateDataNotification,
                                        object: nil)
    }
}

/*
 ※通知の受信解除（removeObserver）はiOS9以降ではdeinit時に自動で実行されます。
 ※Selectorは実行時に呼び出すメソッドが決定する、Objective-C方式の動的な呼び出しを行うため、updateUIメソッドには@objc属性をつけています。
 
 NotificationCenterパターンは通知名の文字列で簡単に通知を実装できますが、多用すると処理の流れが追いづらく、スパゲッティプログラムになる可能性もあるので、少し注意が必要です。N対Nの通知が必要な場合や通知したいオブジェクト間に直接の参照関係がない場合にも利用できるため、そのようなケースでは有効です。
 */

/*
 Closure Callbackパターンは通知完了後の処理を呼び出しメソッドの近くに書けるため、可読性が高くなります。ただし複数の非同期処理を逐次実行する場合は、クロージャーのネストが深くならないように注意が必要です。
 */
//Closureのネストが深くなる例
/*
    func receiveUIEvent() {
        model.updateData(completion: { data in
            model.updateData(completion: { data in
                model.updateData(completion: { data in
                    print(data)
                })
            })
        })
    }
 */
/*
 Closure CallbackパターンはUIKitでも利用されています。例えば、UIAlertControllerのUIAlertActionはダイアログタップ時の処理をクロージャーで指定します。
 */
/*
 UIAlertAction
 let alertAction = UIAlertAction(title: "OK",
 style: .default) { handler in
 // OKボタンタップ時の処理
 print("OKがタップされました")
 }
 */

/*
 通知パターンの比較と使い分け
 最後に通知のパターンの使い分けについて考えてみます。
 
 通知のパターンはこれが一番良いというものはありません。用途に応じて適切に通知のパターンを選択する必要があります。まずは通知元と通知先の数の関係に応じて通知のパターンを選択します。その上で、各通知方法のメリット・デメリットを考慮し、採用するのが良いかと思います。
 
 通知のパターン    通知元と通知先の数    メリット    デメリット
 Delegate    1：1    プロトコルにより実装すべき通知インタフェースが明確。    通知するメソッドが1つの場合は、記述量に見合わない。
 Notification    N：N    直接の参照がないオブジェクト間でも通知が可能。オブジェクト間が疎結合。    多用すると処理が追いづらくなる。グローバルなスコープで通知を行うため、プログラマが意図しない処理が動いてしまう可能性がある。
 KVO    1：N    WKWebViewなどKVOに対応したクラスと相性が良い。    Objective-Cのランタイムが必要。構造体では利用できない。
 Closure Callback    1：1    処理の依頼部分と完了後の処理を近くに書くことができ、可読性が高い。    クロージャーのネストが増えすぎると逆に可読性が落ちる。
 Data Binding    1：N    構造体でもKVOと同様のことが実現可能。    言語レベルでサポートされないため、実装なための記述量が増える、もしくはライブラリの採用が必要
 少し長めになってしまいましたが、ご覧いただきありがとうございます。間違っている点や不明な点があれば編集リクエストやコメントにて記載いただけますと幸いです。
 */

