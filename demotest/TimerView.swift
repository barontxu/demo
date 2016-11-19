//
//  TimerView.swift
//  demotest
//
//  Created by zizhe on 14/11/2016.
//  Copyright © 2016 zizhe. All rights reserved.
//

import UIKit

class TimerView: UIView, UIScrollViewDelegate {
    
    //basic configs
    let timerConfig         : TimerConfig = TimerConfig()
    
    // raterScroll and settings
    var raterScrollView     : RaterScrollView!
    var settings            : RaterSettings = RaterSettings()
    
    // background views contains three gradient color
    var up_back_view        : UIView!
    var mid_back_view       : UIView!
    var bottom_back_view    : UIView!
    
    // stage information
    var stage               : Int!
    
    // two value setter and related variable in stage1
    var duration_y_range    : [CGFloat]!
    var gold_y_range        : [CGFloat]!
    var duration            : Int!
    var gold                : Int!
    var now_setting         : String! //indicate which setter is using

    
    var completition        : ((CGFloat) -> ())?

    override func willMove(toSuperview newSuperview: UIView?) {
        stage = 1
        add_three_background_views()
        set_decorations()
        
        let stage1 = timerConfig.stage1
        
        duration_y_range = stage1.duration_set_frame_offset_range.map{$0 * bounds.height}
        gold_y_range = stage1.gold_set_frame_offset_range.map{$0 * bounds.height}
        
        let duration_view = ValueSetter(frame:CGRect(x: 0, y: stage1.duration_set_frame_offset_range[0]*bounds.height,
                                             width: bounds.width, height: stage1.value_height*bounds.height),
                                type: "sadsa", need_top_line: true, need_bottom_line: true)
        
        let gold_view = ValueSetter(frame:CGRect(x: 0, y: stage1.gold_set_frame_offset_range[0]*bounds.height,
                                              width: bounds.width, height: stage1.value_height*bounds.height),
                                 type: "sadsa", need_top_line: false, need_bottom_line: true)
        
        self.insertSubview(duration_view, belowSubview: up_back_view)
        self.insertSubview(gold_view, belowSubview: up_back_view)
        
        
        if newSuperview != nil {
            raterScrollView = RaterScrollView(frame: self.bounds)
            raterScrollView.settings = settings
            raterScrollView.delegate = self
            self.addSubview(raterScrollView)
        }
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>){
        let p = raterScrollView.closestPointAndValue(targetContentOffset.pointee)
        targetContentOffset.pointee.y = p.0.y
        print(p.0.y)
        self.raterScrollView.ruler.color_paras = [CGFloat(181.0/255.0), CGFloat(181.0/255.0), CGFloat(181.0/255.0), 0]
        self.raterScrollView.ruler.setNeedsDisplay()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("BeginDragging")
        let touch_pos :CGPoint =  scrollView.panGestureRecognizer.location(in: self)
        
        if is_float(f: touch_pos.y, in_range: duration_y_range) {
            self.raterScrollView.contentOffset = CGPoint(x: 0.0, y: 19.5)
            self.raterScrollView.ruler.color_paras = [CGFloat(181.0/255.0), CGFloat(181.0/255.0), CGFloat(181.0/255.0), 1.0]
            self.raterScrollView.ruler.setNeedsDisplay()
            now_setting = "duration"

        } else if is_float(f: touch_pos.y, in_range: gold_y_range) {
            self.raterScrollView.contentOffset = CGPoint(x: 0.0, y: 19.5)
            self.raterScrollView.ruler.color_paras = [CGFloat(181.0/255.0), CGFloat(181.0/255.0), CGFloat(181.0/255.0), 1.0]
            self.raterScrollView.ruler.setNeedsDisplay()
            now_setting = "gold"
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }

    func is_float(f: CGFloat, in_range range: [CGFloat]) -> Bool {
        if (f > range[0] + 1) && (f < range[1] - 1) {
            return true
        }
        return false
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

