//
//  Monster.swift
//  Game/RPG
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import Foundation

/**
 * RPG の Base モンスター
 */
class Monster: NSObject {
    
    var name: String // 名前
    let power: Int = 5 // 攻撃力
    
    // ヒットポイント：Objecive-C からでも読める
    @objc dynamic var hitPoint: Int
    var damaged: NSKeyValueObservation? = nil // ダメージ監視
    
    // 初期設定（init）
    init(name: String, hitPoint: Int) {
        self.name = name
        self.hitPoint = hitPoint
        super.init()
    }
    
    /** method **/
    /// アタック（モンスターの攻撃）
    func attack(to player: Monster , from enemy: Monster) {
        player.hitPoint -= enemy.power
    }
}
