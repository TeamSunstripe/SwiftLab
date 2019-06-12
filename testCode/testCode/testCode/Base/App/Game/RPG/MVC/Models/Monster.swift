//
//  Monster.swift
//  Game/RPG
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import Foundation

/**
 * struct
 * RPG の Weapon 構造体
 */
struct Weapon {
    let name: String
    let strength: Int
}

/**
 * struct
 * RPG の Item 構造体
 */
struct Item {
    let name: String
    let description: String
    let addPoint: Int? = nil
    let addStrength: Int? = nil
}

/**
 * RPG の Base モンスター
 */
class Monster: NSObject {
    
    var name: String // 名前
    let URLString: String // 画像URL
    let power: Int = 5 // 攻撃力
    
    // ヒットポイント：Objecive-C からでも読める
    @objc dynamic var hitPoint: Int
    var damaged: NSKeyValueObservation? = nil // ダメージ監視
    
    // 初期設定（init）
    init(name: String, hitPoint: Int) {
        self.name = name
        self.hitPoint = hitPoint
        self.URLString = ""
        super.init()
    }
    
    init(name: String, urlString URLString: String, hitPoint: Int) {
        self.name = name
        self.URLString = URLString
        self.hitPoint = hitPoint
        super.init()
    }
    /** method **/
    /// アタック（モンスターの攻撃）
    func attack(to player: Monster , from enemy: Monster) {
        if enemy.isKind(of: PlayerHero.self) {
            let p: PlayerHero = enemy as! PlayerHero
            let weapons = p.hero.weapons.map{ $0.strength }
            let damagePoint = enemy.power + weapons.reduce(0, {$0 + $1 })
            print("damagePoint : \(damagePoint)")
            player.hitPoint -= damagePoint
        } else {
            player.hitPoint -= enemy.power
        }
    }
}
