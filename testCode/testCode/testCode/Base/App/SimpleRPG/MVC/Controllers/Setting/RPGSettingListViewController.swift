//
//  RPGSettingListViewController.swift
//  App/SimpleRPG
//
//  Created by YouOhshima on 2019/06/06.
//  Copyright © 2019年 Team SunStripe. All rights reserved.
//

import UIKit

@IBDesignable class RPGSettingListViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: {
            print("設定画面を閉じる")
        })
    }
}
