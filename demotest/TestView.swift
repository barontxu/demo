//
//  TestView.swift
//  anime
//
//  Created by mmxs47 on 16/10/29.
//  Copyright © 2016年 mmxs47. All rights reserved.
//




///*
//  一个使用AnimeLayer的例子。
// */
//import UIKit
//
//class TestView: UIView {
//    
//    var animeLayer: AnimeLayer!
//    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        animeLayer = AnimeLayer(superRect: self.frame)
//        animeLayer.setAnimeDuration(0.4)
//        
//        animeLayer.setAnimeCenterX(0.9) // 动画整体X坐标，取值0～1， 0为目标视图左边界，1为右边界。
//        
//        animeLayer.setLargeCircleRadius(0.5) // 大圆半径，取值0～1， 1为半个横视图距离。
//        animeLayer.setLargeCircleCenterY(0.2) // 大圆中心位置垂直分量，取值0～1， 0为目标视图上边界，1为下边界。
//        
//        animeLayer.setSmallCircleRadius(0.3)  // 小圆半径，取值0～1， 1为半个横屏幕距离。
//        animeLayer.setSmallCircleCenterY(0.8)  // 小圆中心位置垂直分量，取值0～1， 0为目标视图上边界，1为下边界。
//        
//        animeLayer.fillColor = UIColor.green.cgColor
//        animeLayer.strokeColor = UIColor.black.cgColor
//        animeLayer.lineWidth = 3
//        
//        layer.addSublayer(animeLayer)
//    }
//
//}
