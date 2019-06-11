//
//  PlayerHero.swift
//  Game/RPG
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import Foundation

class PlayerHero: Monster {
    var hero: Hero = Hero(name: "勇者ヨシヒコ", hitPoint: 90, magicPoint: 12, weapons: [])
    
    override init(name: String,hitPoint: Int) {
        hero.name = name
        hero.hitPoint = hitPoint
        super.init(name: name, hitPoint: hitPoint)
    }
    
    func getItems ( items: [Item] ) {
        print(items)
    }
}
