//
//  DataBindingView.swift
//  DataBinding/MVC/Views
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe.inc All rights reserved.
//

import Foundation

/*
 6. Data Bindingパターン
 最後に、Data Bindingパターンを説明します。Swiftではデータバインディングの仕組みは言語としてサポートされておらず、その実現のために大抵はライブラリを利用しています。Data Bindingパターンを実現する方法の一つとして、bind の仕組みを備えたgenericな型を用意し、それをプロパティとすることが挙げられます。
 */

class DataBindingView {
    let model: DataBindingModel = DataBindingModel()
    
    init() {
        // データの変更時の処理を記述
        model.data.bind() { data in
            print(data)
        }
    }
    
    func receiveUIEvent() {
        model.updateData()
    }
}
