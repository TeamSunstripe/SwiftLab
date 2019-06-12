//
//  RPGMainViewController.swift
//  App/SimpleRPG
//
//  Created by YouOhshima on 2019/06/06.
//  Copyright © 2019年 Team SunStripe. All rights reserved.
//

import UIKit

@IBDesignable class RPGMainViewController: UIViewController {
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var gameStartButton: UIButton!
    @IBOutlet weak var gameSettingButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    
    @IBOutlet weak var MainTitleLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapStartGame(_ sender: Any) {
        // デバッグ中；バトル画面へ
        let storyboard: UIStoryboard = UIStoryboard(name: "RPG", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "RPGGameBattleViewController")
        present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func tapSettings(_ sender: Any) {
        // デバッグ中；バトル画面へ
        let storyboard: UIStoryboard = UIStoryboard(name: "RPG", bundle: nil)
        
        let nextView = storyboard.instantiateViewController(withIdentifier: "RPGSettingNavigationController")
        present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func tapEnd(_ sender: Any) {
        let presenting = self.presentingViewController // RPGStartViewController を想定
        self.dismiss(animated: false, completion: {
            presenting?.dismiss(animated: false, completion: {
                print("ゲーム終了")
            })
        })
    }
}
