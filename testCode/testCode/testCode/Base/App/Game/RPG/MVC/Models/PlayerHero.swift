//
//  PlayerHero.swift
//  Game/RPG
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import Foundation

struct Hero {
    var name: String
    var hitPoint: Int
    let magicPoint: Int
    var weapons: [Weapon]
    let items: [Item]
}

class PlayerHero: Monster {
    var hero: Hero = Hero(name: "勇者ヨシヒコ", hitPoint: 90, magicPoint: 12, weapons: [], items: [])
    
    /// プレイヤー：勇者陣 の処理の書き換え
    override init(
        name: String,
        urlString URLString: String,
        hitPoint: Int) {
        hero.name = name
        hero.hitPoint = hitPoint
        super.init(name: name,urlString: URLString, hitPoint: hitPoint)
    }
    
    /// プレイヤー：勇者陣 が アイテムをゲットする時の処理
    func getItem ( item: Item? ) {
        if let item = item {
            print("\(hero.name)は、\(item.name)を手に入れた")
        }
    }
    
    // 複数
    func getItems ( items: [Item?]? ) {
        if let items = items , !(items.isEmpty) {
            print("\(hero.name)は")
            for item in items {
                if let item = item {
                    print("\(item.name)")
                }
            }
            print("を手に入れた")
        }
    }
}
