//
//  TimerView.swift
//  demotest
//
//  Created by zizhe on 14/11/2016.
//  Copyright © 2016 zizhe. All rights reserved.
//

import UIKit

class TimerView: UIView, UIScrollViewDelegate {
    
    let timerConfig         : TimerConfig = TimerConfig()
    
    var raterScrollView     : RaterScrollView!
    var settings            : RaterSettings = RaterSettings()
    
    
    var up_back_view        : UIView?
    var mid_back_view       : UIView?
    var bottom_back_view    : UIView?

    var completition        : ((CGFloat) -> ())?

    override func willMove(toSuperview newSuperview: UIView?) {
//        add_three_background_views()
//        set_decorations()
        
        if newSuperview != nil {
            print("111111~~~~~~~~~~~~~")
            raterScrollView = RaterScrollView(frame: self.bounds)
            raterScrollView.settings = settings
            raterScrollView.delegate = self
            self.addSubview(raterScrollView)
        }
        
        bringSubview(toFront: raterScrollView)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>){
        let p = raterScrollView.closestPointAndValue(targetContentOffset.pointee)
        targetContentOffset.pointee.y = p.0.y
//        self.raterScrollView.ruler.color_paras = [CGFloat(255.0/255.0), CGFloat(255.0/255.0), CGFloat(255.0/255.0), 1.0]
        self.raterScrollView.ruler.setNeedsDisplay()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("BeginDragging")
        self.raterScrollView.contentOffset = CGPoint(x: 0.0, y: 19.5)
        self.raterScrollView.ruler.color_paras = [CGFloat(18.0/255.0), CGFloat(68.0/255.0), CGFloat(255.0/255.0), 1.0]
        self.raterScrollView.ruler.setNeedsDisplay()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

