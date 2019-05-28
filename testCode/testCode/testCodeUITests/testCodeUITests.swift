//
//  testCodeUITests.swift
//  testCodeUITests
//
//  Created by YouOhshima on 2019/05/15.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import XCTest

class testCodeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // タイプ：正常系
    // 前提条件：なし
    // 観点：メニュー画面初期表示の確認
    // 期待する結果：
    // 1.メニュー画面が正常に表示されること
    func testInitialDisplay() {
        
        let app = XCUIApplication()
        
        sleep(3)
        
        // Term画面
        let btn = app.buttons["Button"]
        if btn.exists {
            firstDisplay(app: app)
        }
    }
    
    // 初回インストール時用共通処理
    func firstDisplay(app: XCUIApplication) {
        
        NSLog("%@", "push button")
        
        app.buttons["Button"].tap()
        
        NSLog("%@", "pushed button")
        
        // Term画面
        let btn = app.buttons["Close"]
        if btn.exists {
            secondDisplay(app: app)
        }
    }
    
    func secondDisplay(app: XCUIApplication) {
        sleep(3)
        NSLog("%@", "push button")
        
        app.buttons["Close"].tap()
        
        NSLog("%@", "pushed button")
        sleep(3)
        // firstDisplay(app: app)
        
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    // タイプ：正常系
    // 前提条件：なし
    // 観点：メニュー画面初期表示の確認
    // 期待する結果：
    // 1.Battery画面が正常に表示されること
    func testBatteryInitialDisplay() {
        
        let app = XCUIApplication()
        
        sleep(3)
        
        // Term画面
        let btn = app.buttons["Battery"]
        if btn.exists {
            firstBatteryDisplay(app: app)
        }
    }
    
    // 初回インストール時用共通処理
    func firstBatteryDisplay(app: XCUIApplication) {
        
        NSLog("%@", "push button")
        
        app.buttons["Battery"].tap()
        
        NSLog("%@", "pushed button")
        
        // Term画面
        let btn = app.buttons["Close"]
        if btn.exists {
            secondDisplay(app: app)
        }
    }
    

}
