//
//  RulerView.swift
//  demotest
//
//  Created by zizhe on 15/11/2016.
//  Copyright © 2016 zizhe. All rights reserved.
//

import UIKit

class RulerView: UIView {

    var settings        : RaterSettings = RaterSettings()
    var color_paras     : [CGFloat]?
    
    override func didMoveToSuperview() {
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        let cntx = UIGraphicsGetCurrentContext()
        cntx?.drawRuler(settings)
        if let cp = color_paras {
            cntx?.drawRuler(settings, color_paras: cp)
        } else {
            cntx?.drawRuler(settings)
        }
        super.draw(rect)
    }
    

}
