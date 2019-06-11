//
//  ParsonalModel.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/24.
//  Copyright © 2019 Team Sun Stripe All rights reserved.
//

import Foundation

class ParsonalModel : NSObject {
    
    var resource: ParsonalData? = nil
    let requestApiURL = "https://user?id=0000000000"
    
    func getResource() -> ParsonalData? {
        return resource
    }
    
    func requestApi() {
        
        let tmp_object = ParsonalData.init(parsonal: ["likes":"","notlikes":""])
        self.resource = tmp_object
    }
}
