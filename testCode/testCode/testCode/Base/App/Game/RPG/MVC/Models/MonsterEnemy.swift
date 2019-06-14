//
//  MonsterEnemy.swift
//  Game/RPG
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import Foundation

class MonsterEnemy: Monster {
    var items: [Item?] = [Item(name: "キノコ", description: "回復する"),nil]  // 落とすアイテムリスト格納
    
    /// モンスターを倒した時の処理
    func die() -> Item? {
        print("敵を倒したぞ！！")
        // モンスターを倒した時のロジック
        #if swift(>=4.2)
        if let item: Item? = items.randomElement() {
            if let item = item {
                print("\(item.name)を落とした")
                return item
            }
        }
        #else
        let r = Int(arc4random()) % Int(items.count)
        if let item = items[r] {
            print("\(item.name)を落とした")
            return item
        }
        #endif
        return nil
    }
}
