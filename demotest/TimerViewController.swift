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
    
    @IBOutlet weak var testButton: UIButton!
    
    var test_counter: Int = 0
    
    @IBAction func testAction(_ sender: Any) {
        let tmV = self.view as! TimerView
        if test_counter % 2 == 0{
            tmV.do_anime(reverse: false)
        } else {
            tmV.do_anime(reverse: true)
        }
        test_counter += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rater = self.view as! TimerView

        var settings = rater.settings
        settings.separator = 14.0
        rater.settings = settings
        rater.completition = { print($0) }
        view.bringSubview(toFront: testButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


