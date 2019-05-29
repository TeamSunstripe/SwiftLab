//
//  Animal.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/24.
//  Copyright © 2019 Team Sun Stripe All rights reserved.
//

import Foundation

class Animal: ThingData {
    
    private var food = ""
    override init(thing: NSDictionary) {
        super.init(thing: thing)
        self.setModel(thing: thing)
        born()
    }
    
    override func setModel(thing: NSDictionary) {
        super.setModel(thing: thing)
        if thing.value(forKey: "food") != nil {
            food = thing.value(forKey: "food") as! String
        }
    }
    
    public func setFood(food: String) {
        self.food = food
        NSLog("%@は「%@」をよく食べるようだ",name,food)
    }
    
    public func born() {
        NSLog("%@は生まれました",name)
    }
    
    public func eat() {
        NSLog("%@は「%@」を食べました",name,food)
    }
    
    public func die() {
        NSLog("%@は死にました",name)
    }
}
