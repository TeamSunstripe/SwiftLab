//
//  ThingModel.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/24.
//  Copyright © 2019 Team Sun Stripe All rights reserved.
//

import Foundation

class ThingModel : NSObject {
    
    var resource: ThingData? = nil
    let requestApiURL = "https://user?id=0000000000"
    
    func getResource() -> ThingData? {
        return resource
    }
    
    func requestApi() {
        
        let tmp_object = ThingData.init(thing: ["name":""])
        self.resource = tmp_object
    }
}
