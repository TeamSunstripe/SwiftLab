//
//  KVOView.swift
//  KVO/MVC/Views
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import UIKit

/*
 4. KVO（Key-Value Observing: キー値監視）パターン
 KVOは特定のオブジェクトのプロパティ値の変化を監視する仕組みです。
 Objective-Cのランタイム機能を利用しているため、監視対象のオブジェクトはObjective-CのNSObjectを継承している必要があります。Swift4では、監視部分のコードをクロージャーで書けるようになり、より使いやすくなりました。
 */
// KVOパターン
class KVOView {
    var model: KVOModel = KVOModel()
    
    // 監視オブジェクトを保持する
    var observation: NSKeyValueObservation?
    
    init() {
        // modelのdataプロパティをKVOで監視する
        observation = model.observe(\.data, options: [.new]) { model, change in
            // model.dataが変化した場合に実行されるクロージャー
            if let newValue = change.newValue {
                print(newValue) // print(model.data) でもOK
            }
        }
    }
    
    func receiveUIEvent() {
        model.updateData()
    }
}
