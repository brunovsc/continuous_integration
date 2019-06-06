//
//  ViewController.swift
//  continuous_integration
//
//  Created by Bruno Vieira on 16/05/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func bigger10(value: Int) -> Bool{
        if value > 10 {
            return true
        } else {
            return false
        }
    }
    
    func notCovered() -> String {
        let a = 100
        return "\(a)"
    }
}

