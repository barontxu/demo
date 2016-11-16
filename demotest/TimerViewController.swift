//
//  TimerViewController.swift
//  demotest
//
//  Created by zizhe on 9/2/16.
//  Copyright © 2016 zizhe. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    let CONFIG = TimerConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rater = self.view as! TimerView

        var settings = rater.settings
        settings.separator = 14.0
        rater.settings = settings
        rater.completition = { print($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


