//
//  UserModel.swift
//  testCode
//
//  Created by YouOhshima on 2019/05/15.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import Foundation

class UserModel : NSObject {
    
    var resource: UserData? = nil
    let requestApiURL = "https://user?id=0000000000"
    
    func getResource() -> UserData? {
        return resource
    }
    
    func requestApi() {
 
        let tmp_object = UserData.init(user: ["name":"","password":""])
        self.resource = tmp_object
    }
}
