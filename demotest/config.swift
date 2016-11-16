//
//  config.swift
//  demotest
//
//  Created by zizhe on 02/11/2016.
//  Copyright © 2016 zizhe. All rights reserved.
//

import Foundation
import UIKit

struct TimerConfig {
    let offset_to_mid_percentage: CGFloat = 148.0 / 463
    
//    let up_colors = [UIColor(red: 76.0 / 255, green: 60.0 / 255, blue: 100.0 / 255, alpha: 1.0),
//                     UIColor(red: 70.0 / 255, green: 60.0 / 255, blue: 100.0 / 255, alpha: 1.0)]
//    
//    let mid_colors = [UIColor(red: 68.0 / 255, green: 62.0 / 255, blue: 102.0 / 255, alpha: 1.0),
//                      UIColor(red: 61.0 / 255, green: 62.0 / 255, blue: 102.0 / 255, alpha: 1.0)]
//    
//    let bottom_colors = [UIColor(red: 64.0 / 255, green: 56.0 / 255, blue: 92.0 / 255, alpha: 1.0),
//                         UIColor(red: 58.0 / 255, green: 56.0 / 255, blue: 93.0 / 255, alpha: 1.0)]
    
    let up_colors       :[UIColor] = [UIColor.red, UIColor.red]
    let mid_colors      :[UIColor] = [UIColor.clear, UIColor.clear]
    let bottom_colors   :[UIColor] = [UIColor.clear, UIColor.clear]
    
    let stage1 = Stage1()
    let stage2 = Stage2()
    
    struct Stage1 {
        let button_radius_percentage_by_width       : CGFloat = 102.0 / 270
        let offset_to_buttom_percentage             : CGFloat = 463.0 / 463
    }
    
    struct Stage2 {
        let big_button_radius_percentage_by_width   : CGFloat = 146.0 / 270
        let small_button_radius_percentage_by_width : CGFloat = 89.0 / 270
        let offset_to_buttom_percentage             : CGFloat = 236.0 / 463
    }
    
    
}

struct RaterSettings {
    var minValue            : CGFloat = 0
    var maxValue            : CGFloat = 5
    var step                : CGFloat = 0.1
    var bigStep             : Int = 10 // number of steps to display bigstep
    
    var thickLine           : CGFloat = 6
    var thickLineWidth      : CGFloat = 40
    var skinLine            : CGFloat = 2
    var skinLineWidth       : CGFloat = 20
    var separator           : CGFloat = 12
    var baseColor           : (CGFloat,CGFloat,CGFloat) = (0.9,0,0.5)
    
    
    var numberOfSteps       : Int {
        return Int(fabs(maxValue-minValue) / step) + 1
    }
    
    var calculatedHeight    : CGFloat {
        return CGFloat(numberOfSteps) * separator - (separator - thickLine)
    }
}


