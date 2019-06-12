//
//  RPGStartViewController.swift
//  App/SimpleRPG
//
//  Created by YouOhshima on 2019/06/06.
//  Copyright © 2019年 Team SunStripe. All rights reserved.
//

import UIKit

@IBDesignable class RPGStartViewController: BaseGameViewController {
    @IBOutlet weak var StartImageView: UIImageView!
    var timer:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3.0,// 3.0秒遅延させる
            target: self,                              // 自分自身
            selector: Selector(("nextView")),          // method nextView を呼び出す
            userInfo: nil,                             // 引数なし
            repeats: false)                            // 繰り返さない
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func nextView() {
        self.performSegue(withIdentifier: "toSimpleGameMain", sender: nil)
    }
}
