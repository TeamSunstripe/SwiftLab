//
//  DataBindingModel.swift
//  DataBinding/MVC/Models
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import Foundation

//DataBindingパターンの例
/// 簡易的なデータバインディング機能を実現するクラス
class DataBindingVariable<E> {
    var value: E {
        didSet {
            // プロパティオブザーバーによりデータの変更時にバインディング先に通知
            callbacks.forEach { $0(value) }
        }
    }
    
    // バインディング用のクロージャーを保持
    private var callbacks: [((E) -> Void)] = []
    
    init(_ value: E) {
        self.value = value
    }
    
    func bind(dataDidChange: @escaping (E) -> Void) {
        callbacks.append(dataDidChange)
    }
}

class DataBindingModel {
    let data = DataBindingVariable(0)
    
    func updateData() {
        data.value += 1
    }
}
