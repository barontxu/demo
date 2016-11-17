//
//  ExtnCGContext.swift
//  demotest
//
//  Created by zizhe on 15/11/2016.
//  Copyright © 2016 zizhe. All rights reserved.
//

import Foundation

import UIKit

extension CGContext {    
    
    func drawCentralLine(_ anchor: CGPoint, percent: CGFloat, settings: RaterSettings){
        let y = anchor.y
        self.setStrokeColor(red: settings.baseColor.0 - percent, green: percent, blue: settings.baseColor.2, alpha: 1.0)
        self.setLineWidth(settings.thickLine)
        self.move(to: CGPoint(x: anchor.x, y: y))
        self.addLine(to: CGPoint(x: settings.thickLineWidth*1.5, y: y))
        self.strokePath()
    }
    
    func drawRuler(_ settings: RaterSettings,
                   color_paras: [CGFloat] = [181/255.0, 181/255.0, 181/255.0, 0]) {
        
        for i in 0 ..< settings.numberOfSteps + 1{
            self.setStrokeColor(red: color_paras[0], green: color_paras[1], blue: color_paras[2], alpha: color_paras[3])
            
            var x : CGFloat
            if i %  settings.bigStep == 0{
                self.setLineWidth(settings.thickLine)
                x = settings.thickLineWidth
            } else {
                self.setLineWidth(settings.skinLine)
                x =  settings.skinLineWidth
            }
            
            let line_y  : CGFloat = settings.thickLine/2.0 + CGFloat(i) * settings.separator
            let frame_width : CGFloat = CGFloat(width) * 0.5
            
            self.move(to: CGPoint(x: frame_width-x, y: line_y))
            self.addLine(to: CGPoint(x: frame_width, y: line_y))
            
            self.strokePath()
        }
        
    }
}
