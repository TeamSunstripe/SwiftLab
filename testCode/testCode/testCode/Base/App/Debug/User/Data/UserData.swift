//
//  UserData.swift
//  testCode
//
//  Created by YouOhshima on 2019/05/15.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import Foundation

class UserData : NSObject {
    
    var name: String = ""
    var password: String = ""
    
    init(user: NSDictionary) {
        super.init()
        self.setModel(user: user)
    }
    
    func setModel(user: NSDictionary) {
        let name: AnyObject! = user.value(forKey: "name") as AnyObject?
        let password: AnyObject!   = user.value(forKey: "password") as AnyObject?
        self.name = name.description
        self.password   = password.description
    }
}
