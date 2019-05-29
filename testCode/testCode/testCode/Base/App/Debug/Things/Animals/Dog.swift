//
//  Dog.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/24.
//  Copyright © 2019 Team Sun Stripe All rights reserved.
//

import Foundation

class Dog: Animal {
    
    private var bowwow = ""
    
    override init(thing: NSDictionary) {
        super.init(thing: thing)
        self.setModel(thing: thing)
    }
    
    override func setModel(thing: NSDictionary) {
        super.setModel(thing: thing)
        if thing.value(forKey: "bowwow") != nil {
            bowwow = thing.value(forKey: "bowwow") as! String
        }
    }
    
    func setBowwow( bowwow: String) {
        self.bowwow = bowwow
        NSLog("%@は「%@」と吠えるようだ",name,bowwow)
    }
    
    func bark() {
        NSLog("%@は「%@」と吠えた",name,bowwow)
    }
}
