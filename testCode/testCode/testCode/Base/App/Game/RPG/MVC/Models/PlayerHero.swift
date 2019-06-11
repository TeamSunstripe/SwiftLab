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
    let weapons: [Weapon]
}

class PlayerHero: Monster {
    var hero: Hero = Hero(name: "勇者ヨシヒコ", hitPoint: 90, magicPoint: 12, weapons: [])
    
    /// プレイヤー：勇者陣 の処理の書き換え
    override init(name: String,hitPoint: Int) {
        hero.name = name
        hero.hitPoint = hitPoint
        super.init(name: name, hitPoint: hitPoint)
    }
    
    /// プレイヤー：勇者陣 が アイテムをゲットする時の処理
    func getItems ( items: [Item] ) {
        print(items)
    }
}
