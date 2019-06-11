//
//  ThingData.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/24.
//  Copyright © 2019 Team Sun Stripe All rights reserved.
//

import Foundation

class ThingData : NSObject {
    
    var name: String = ""
    
    @objc init(thing: NSDictionary) {
        super.init()
        self.setModel(thing: thing)
    }
    
    func setModel(thing: NSDictionary) {
        let name: AnyObject! = thing.value(forKey: "name") as AnyObject?
        self.name = name.description
    }
}
