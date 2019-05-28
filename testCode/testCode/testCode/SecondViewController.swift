//
//  SecondViewController.swift
//  testCode
//
//  Created by YouOhshima on 2019/05/15.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapedCloseButton(_ button: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapedDebugButton(_ button: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Debug", bundle: nil)
        guard let nextView = storyboard.instantiateInitialViewController() else { return }
        present(nextView, animated: true, completion: nil)
    }
}

