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
    func die() {
        print("敵を倒したぞ！！")
        // モンスターを倒した時のロジック
        if let item: Item? = items.randomElement() {
            if let item = item {
                print("\(item.name)を落とした")
            }
        }
    }
}
