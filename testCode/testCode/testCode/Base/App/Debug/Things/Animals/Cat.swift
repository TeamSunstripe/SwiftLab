//
//  Cat.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/24.
//  Copyright © 2019 Team Sun Stripe All rights reserved.
//

import Foundation

class Cat: Animal {
    
    private var mew = ""
    
    override init(thing: NSDictionary) {
        super.init(thing: thing)
        self.setModel(thing: thing)
    }
    
    override func setModel(thing: NSDictionary) {
        super.setModel(thing: thing)
        if thing.value(forKey: "mew") != nil {
            mew = thing.value(forKey: "mew") as! String
        }
    }
    
    func setMew( mew: String) {
        self.mew = mew
        NSLog("%@は「%@」と泣くようだ",name,mew)
    }
    
    func purr() {
        NSLog("%@は「%@」と泣きました",name,mew)
    }
}
