//
//  ParsonalData.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/24.
//  Copyright © 2019 Team Sun Stripe All rights reserved.
//

import Foundation

class ParsonalData : NSObject {
    
    var likes: NSDictionary = [:]
    var notlikes: NSDictionary = [:]
    
    init(parsonal: NSDictionary) {
        super.init()
        self.setModel(parsonal: parsonal)
    }
    
    func setModel(parsonal: NSDictionary) {
        let likes: AnyObject! = parsonal.value(forKey: "likes") as AnyObject?
        let notlikes: AnyObject!   = parsonal.value(forKey: "notlikes") as AnyObject?
        self.likes = likes as! NSDictionary
        self.notlikes   = notlikes as! NSDictionary
    }
}
