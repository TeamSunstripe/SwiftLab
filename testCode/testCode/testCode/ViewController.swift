//
//  ViewController.swift
//  testCode
//
//  Created by YouOhshima on 2019/05/15.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var openButton: UIButton!
    var timetable: Dictionary<AnyHashable, Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSLog( "%@",UserDefaults.standard.volatileDomainNames )
        print("input")
        timetable = [:]
        for i in 1..<10 {
            let updateString = "OK"
            if var tt: Dictionary<AnyHashable, Any> = timetable {
                tt.updateValue(updateString, forKey: "_\(i)")
                print( tt["_\(i)"]!)
                timetable = tt
            }
        }
        print("display")
        for i in 1..<10 {
            if var tt: Dictionary<AnyHashable, Any> = timetable {
                print( tt["_\(i)"]!)
            }
        }
        if var tt: Dictionary<AnyHashable?, Any?> = timetable {
            timetable = (tt as! Dictionary<AnyHashable, Any>)
            for (key,value) in tt {
                if let _key = key,let _value = value,let _data = tt[_key] as? String {
                    print("data: \(_key):\(_value):\(_data)")
                }
            }
            timetable = (tt as! Dictionary<AnyHashable, Any>)
            
            for i in 1..<5 {
                if tt.isEmpty { break }
                if var dt: Dictionary<AnyHashable, Any> = timetable {
                    dt.removeValue(forKey: "_\(i)")
                    print("timetable : _\(i) 削除されました")
                    print(dt)
                    tt = dt
                    timetable = (tt as! Dictionary<AnyHashable, Any>)
                }
                if tt.isEmpty { break }
            }
            // 全削除
            tt.removeAll()

            if tt.isEmpty {
                timetable = nil
                print("timetable : {空}")
            } else {
                print("timetable : ")
                print(timetable!)
                print(timetable!.capacity)
                print(timetable!.isEmpty)
            }
        }
    }
}

