//
//  BatteryViewController.swift
//  testCode
//
//  Created by YouOhshima on 2019/05/21.
//  Copyright © 2019 You Ohshima. All rights reserved.
//

import UIKit

/**
 * BatteryViewController.swift
 * バッテリーレベル / バッテリーステータスを表示するビューコントローラークラス
 **/
class BatteryViewController: UIViewController {
    // バッテリーレベルのラベル
    @IBOutlet weak var labelBatteryLevel: UILabel!
    // バッテリーステータスのラベル
    @IBOutlet weak var labelBatteryStatus: UILabel!
    
    // 初期設定
    override func viewDidLoad() {
        super.viewDidLoad()
        // バッテリーの監視を開始
        startBatteryMonitoring()
        // バッテリー残量の変化に対する処理
        displayBatteryLevel()
        // バッテリーの給電状況の変化に対する処理
        displayBatteryState()
    }
    
    @IBAction func tapedCloseButton(_ button: UIButton) {
        stopBatteryMonitoring()
        dismiss(animated: true, completion: nil)
    }
}

/**
 * バッテリーの状態の監視に関する
 **/
extension BatteryViewController {
    /// バッテリーの状態の監視を開始
    func startBatteryMonitoring() {
        UIDevice.current.isBatteryMonitoringEnabled = true

        #if swift(>=4.2)
        // バッテリー残量の変化を監視
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(BatteryViewController.batteryLevelChanged(notification:)),
            name: UIDevice.batteryLevelDidChangeNotification, object: nil)
        // バッテリー給電状況の変化を監視
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(BatteryViewController.batteryStateChanged(notification:)),
            name: UIDevice.batteryStateDidChangeNotification, object: nil)
        #else
        // バッテリー残量の変化を監視
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(BatteryViewController.batteryLevelChanged(notification:)),
            name: Notification.Name.UIDeviceBatteryLevelDidChange, object: nil)
        // バッテリー給電状況の変化を監視
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(BatteryViewController.batteryStateChanged(notification:)),
            name: Notification.Name.UIDeviceBatteryStateDidChange, object: nil)
        #endif
    }
    
    /// バッテリーの状態の監視を終了
    func stopBatteryMonitoring() {
        UIDevice.current.isBatteryMonitoringEnabled = false
        
        #if swift(>=4.2)
            NotificationCenter.default.removeObserver(
                self,
                name: UIDevice.batteryLevelDidChangeNotification, object: nil)
            NotificationCenter.default.removeObserver(
                self,
                name: UIDevice.batteryStateDidChangeNotification, object: nil)
        #else
            NotificationCenter.default.removeObserver(
                self,
                name:Notification.Name.UIDeviceBatteryLevelDidChange, object: nil)
            NotificationCenter.default.removeObserver(
                self,
                name: Notification.Name.UIDeviceBatteryStateDidChange, object: nil)
        #endif
        
    }
}

/**
 *  バッテリー残量の変化に対する通知設定に関する
 */
extension BatteryViewController {
    /// バッテリー残量の変化に対する通知設定の処理
    @objc func batteryLevelChanged(notification: Notification) {
        // バッテリー残量の変化に対するメソッド
        displayBatteryLevel()
    }
    /// バッテリーの給電状況の変化に対する通知設定の処理
    @objc func batteryStateChanged(notification: Notification) {
        displayBatteryState()
    }

}

/**
 * バッテリー残量の変化に関する
 */
extension BatteryViewController {
    /// バッテリー残量の変化に対する処理
    func displayBatteryLevel() {
        // バッテリーのモニタリングをenableにする
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        // Battery Lebelの初期値
        let bLevel:Float = UIDevice.current.batteryLevel
        
        if bLevel == -1 {
            // バッテリーレベルがモニターできないケース
            labelBatteryLevel.text = "バッテリーモニターNG"
        } else {
            labelBatteryLevel.text = "バッテリーレベル:  \(bLevel * 100) %"
        }
    }
    
    /// バッテリーの給電状況の変化に対する処理
    func displayBatteryState() {
        // Battery Statusの初期値
        var state:String = "バッテリーステータス: "
        
        switch UIDevice.current.batteryState {
        case .unplugged:
            state += "Unplugged"
        case .charging:
            state += "Charging"
        case .full:
            state += "full"
        case .unknown:
            state += "Unknown"
        }
        
        labelBatteryStatus.text = state
    }
}
