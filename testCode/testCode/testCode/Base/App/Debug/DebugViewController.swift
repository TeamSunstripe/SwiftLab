//
//  DebugViewController.swift
//  testCode
//
//  Created by Oshima You on 2019/05/24.
//  Copyright © 2019 Shinkai Asari. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var debugView: DebugView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapedCloseButton(_ button: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

