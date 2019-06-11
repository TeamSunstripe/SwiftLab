//
//  KVOModel.swift
//  KVO/MVC/Models
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import Foundation

// NSObjectを継承
class KVOModel: NSObject {
    // @objcとdynamicをつける
    @objc dynamic var data: Int = 0
    func updateData() {
        data += 1
    }
}

/* KVOではObjective-Cのランタイム呼び出しによる動的ディスパッチ（実行時に動的にプロパティが決定される）を利用するため、監視するプロパティには@objc属性とdynamicキーワード（dynamic dispatch）が必要です。
 
 WebKitのWKWebViewのプロパティの中には、titleやurl、estimatedProgressなど、KVOに対応したプロパティ(key-value observing compliant)があり、KVOと相性が良いです。逆に、構造体（struct）はNSObjectを継承することができないため、KVOは利用できません。
 */
