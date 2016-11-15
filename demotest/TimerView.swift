//
//  TimerView.swift
//  demotest
//
//  Created by zizhe on 14/11/2016.
//  Copyright © 2016 zizhe. All rights reserved.
//

import UIKit

class TimerView: UIView {
    
    let CONFIG = TimerConfig()

    var up_back_view: UIView?
    var mid_back_view: UIView?
    var bottom_back_view: UIView?

    override func willMove(toSuperview newSuperview: UIView?) {
        add_three_background_views()
        set_decorations()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

