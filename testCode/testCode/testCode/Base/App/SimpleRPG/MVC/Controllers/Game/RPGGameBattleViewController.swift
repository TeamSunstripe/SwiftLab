//
//  RPGGameBattleViewController.swift
//  App/SimpleRPG
//
//  Created by YouOhshima on 2019/06/06.
//  Copyright © 2019年 Team SunStripe. All rights reserved.
//

import UIKit

@IBDesignable class RPGGameBattleViewController: BaseGameViewController {
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var monsterBackgroundImageView: UIImageView! // TODO: 背景画像（仮）
    @IBOutlet weak var monsterAttackButton: UIButton!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerBackgroundImageView: UIImageView!  // TODO: 背景画像（仮）
    @IBOutlet weak var playerAttackButton: UIButton!
    
    var playerHeros: [PlayerHero?] = [] // 味方
    var steelSword = Weapon(name: "鋼の剣", strength: 20)
    var enemySlimes: [MonsterEnemy?] = [] // 敵
    var observation:NSKeyValueObservation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初回画面には何も表示がない
        monsterImageView.alpha = 0.0
        monsterAttackButton.alpha = 0.0
        playerImageView.alpha = 0.0
        playerAttackButton.alpha = 0.0
        
        struct Hero_ {
            let name: String
            let hitPoint: Int
            let magicPoint: Int
            let weapon: Weapon
        }
        
        struct Enemy {
            let name: String
            let hitPoint: Int
        }
        
        steelSword = Weapon(name: "鋼の剣", strength: 20)
        let yoshihiko = Hero(name: "勇者ヨシヒコ", hitPoint: 90, magicPoint: 12, weapons: [steelSword], items: [])
        
        print(yoshihiko[keyPath: \Hero.name]) // "勇者ヨシヒコ"
        print(yoshihiko[keyPath: \Hero.weapons.first!.name]) // "鋼の剣"
        
        playerHeros = [PlayerHero(name: "勇者ヨシヒコ",urlString: "https://image.showroom-live.com/showroom-prod/image/avatar/1018274.png", hitPoint: 90)]
        
        enemySlimes = [MonsterEnemy(name: "スライム",urlString: "https://camo.qiitausercontent.com/d78e2729745400d7bc4e3b93e268231c3a3488da/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3233323731352f65633738636139302d666461392d653035322d353464372d3331323231333761356365332e706e67", hitPoint: 10)]
        
        if !enemySlimes.isEmpty, let enemySlime = enemySlimes.first,let enemy_slime :MonsterEnemy = enemySlime,!playerHeros.isEmpty, let playerHero = playerHeros.first,let player_hero:PlayerHero = playerHero {
            
            player_hero.hero.weapons = [steelSword]
            
            //モンスター
            monsterImage(imageView: monsterImageView, URLString: enemy_slime.URLString)
            // 監視オブジェクトを保持する
            enemy_slime.damaged = enemy_slime.observe(\.hitPoint, options: [.new,.old], changeHandler: { me,change in
                let diff = (change.newValue ?? 0) - (change.oldValue ?? 0)
                let isDamaged = diff < 0
                if me.hitPoint > 0 {
                    print("\(me.name)::HP(\(me.hitPoint))は、HPを\(abs(diff))\(isDamaged ? "消費した" : "回復した")")
                } else {
                    if !self.monsterImageView.isHidden {
                        print("\(me.name)は死亡した")
                        player_hero.getItem(item: (me.die() ) )
                        
                        #if swift(>=4.2)
                        UIView.animate(withDuration: 1.0, delay: 1.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                            self.monsterImageView.alpha = 0.0
                        }, completion: { finished in
                            if finished {
                                self.monsterImageView.isHidden = true
                            }
                        })
                        #else
                        UIView.animate(withDuration: 1.0, delay: 1.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                            self.enemyImageView.alpha = 0.0
                        }, completion: { finished in
                            if finished {
                                self.enemyImageView.isHidden = true
                            }
                        })
                        #endif
                        
                    } else {
                        
                    }
                }
            })
            
            monsterImage(imageView: playerImageView, URLString: player_hero.URLString)
            // 監視オブジェクトを保持する
            player_hero.damaged = player_hero.observe(\.hitPoint, options: [.new,.old], changeHandler: { me,change in
                let diff = (change.newValue ?? 0) - (change.oldValue ?? 0)
                let isDamaged = diff < 0
                if me.hitPoint > 0 {
                    print("\(me.name)::HP(\(me.hitPoint))は、HPを\(abs(diff))\(isDamaged ? "消費した" : "回復した")")
                } else {
                    if !self.playerImageView.isHidden {
                        print("\(me.name)は死亡した")
                        
                        #if swift(>=4.2)
                        UIView.animate(withDuration: 3.0, delay: 2.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                            self.playerImageView.alpha = 0.0
                        }, completion: { finished in
                            if finished {
                                self.playerImageView.isHidden = true
                            }
                        })
                        #else
                        UIView.animate(withDuration: 3.0, delay: 2.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                            self.playerImageView.alpha = 0.0
                        }, completion: { finished in
                            if finished {
                                self.playerImageView.isHidden = true
                            }
                        })
                        #endif
                        
                    } else {
                        
                    }
                }
            })
        }
        
        let steelSword1 = Weapon(name: "鋼の剣", strength: 20)
        let yoshihiko1 = Hero_(name: "勇者ヨシヒコ", hitPoint: 90, magicPoint: 12, weapon: steelSword1)
        
        let keyPath1 = \Hero_.weapon
        let keyPath2 = keyPath1.appending(path: \Weapon.name)// 名前(name)を追加
        
        print(yoshihiko1[keyPath: keyPath1]) // "Weapon(name: "鋼の剣", strength: 20)"
        print(yoshihiko1[keyPath: keyPath2]) // "鋼の剣"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 初回読み込み
        startViews()
    }
    
    // 初回読み込まれる
    func startViews() {
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseOut, animations: {
            
            self.monsterImageView.alpha = 1.0
            self.playerImageView.alpha = 1.0
            
        }, completion: { (finished) in
            if finished {
                self.startButtons()
            }
        })
    }
    
    func startButtons() {
        UIView.animate(withDuration: 1.0, delay: 3.0, options: .curveEaseOut, animations: {
            
            self.monsterAttackButton.alpha = 1.0
            self.playerAttackButton.alpha = 1.0
            
        }, completion: { (finished) in
            if finished {
                
            }
        })
    }
    
    @IBAction func slimeAttack(_ sender: Any) {
        if !enemySlimes.isEmpty, let enemySlime = enemySlimes.first,let enemy_slime = enemySlime,!playerHeros.isEmpty, let playerHero = playerHeros.first,let player_hero = playerHero {
            print("\(enemy_slime.name)の攻撃!")
            // スライムの攻撃!
            enemy_slime.attack(to: player_hero,from: enemy_slime)
            // "勇者ヨシヒコは、HPを5消費した"と出力される
        } else {
            print(enemySlimes)
            let enemySlime = enemySlimes.first
            print(enemySlime)
            print("何も起こらなかった")
        }
    }
    
    @IBAction func heroAttack(_ sender: Any) {
        if !enemySlimes.isEmpty, let enemySlime = enemySlimes.first,let enemy_slime = enemySlime,!playerHeros.isEmpty, let playerHero = playerHeros.first,let player_hero = playerHero {
            print("\(player_hero.name)の攻撃!")
            // 勇者ヨシヒコの攻撃!
            player_hero.attack(to: enemy_slime,from: player_hero)
            // "勇者ヨシヒコは、HPを5消費した"と出力される
        } else {
            print(enemySlimes)
            let enemySlime = enemySlimes.first
            print(enemySlime)
            print("何も起こらなかった")
        }
    }
    
    func monsterImage(imageView: UIImageView,URLString: String) {
        //http://livedoor.blogimg.jp/amosaic/imgs/4/3/4360becd.jpg
        let imageURLString:String? = URLString
        
        if let URLString = imageURLString {
            let url = URL(string: URLString)
            do {
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data)
                imageView.image = image
                
            } catch let err {
                print("Error : \(err.localizedDescription)")
            }
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data!)
                }
            }).resume()
        }
    }
}
