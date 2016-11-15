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
    var up_back_view: UIView?
    var mid_back_view: UIView?
    var bottom_back_view: UIView?
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var ParaTableVIew: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bringSubview(toFront: TitleLabel)
        view.bringSubview(toFront: ParaTableVIew)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


//extension TimerViewController {
//    
//    func set_decorations() {
//        add_title_view()
//        add_description_view()
//    }
//    
//    func add_title_view(){
//        let label = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 20))
//        label.font = label.font.withSize(20)
//        label.center = CGPoint(x: self.view.frame.width / 2, y: 50)
//        label.textAlignment = NSTextAlignment.center
//        label.text = "Focus"
//        label.textColor = UIColor.white
//        self.view.addSubview(label)
//    }
//    
//    func add_description_view() {
//        let label = UILabel(frame: CGRect(x: 100, y: 50, width: 300, height: 80))
//        label.font = UIFont.boldSystemFont(ofSize: 30.0)
//        label.center = CGPoint(x: self.view.frame.width / 2, y: 150)
//        label.textAlignment = NSTextAlignment.center
//        label.text = "Focus Xxx Xx Xxx"
//        label.textColor = UIColor.white
//        self.view.addSubview(label)
//
//    }
//    
//    
//}


//// add three background views
//extension TimerViewController {
//    
//    func add_three_background_views() {
//        let width = self.view.frame.width
//        
//        let heights = view_heights()
//        let origins = view_origins()
//        
//        let up_view = get_view_with_bg_color(origins[0], width: width, height: heights[0], colors: CONFIG.up_colors)
//        let mid_view = get_view_with_bg_color(origins[1], width: width, height: heights[1], colors: CONFIG.mid_colors)
//        let bottom_view = get_view_with_bg_color(origins[2], width: width, height: heights[2], colors: CONFIG.bottom_colors)
//        
//        self.up_back_view = up_view
//        self.mid_back_view = mid_view
//        self.bottom_back_view = bottom_view
//        
//        self.view.addSubview(self.up_back_view!)
//        self.view.addSubview(self.mid_back_view!)
//        self.view.addSubview(self.bottom_back_view!)
//    }
//    
//    func view_heights() -> [CGFloat] {
//        let view_frame = self.view.frame
//        
//        let otmp = CONFIG.offset_to_mid_percentage
//        let otbp: CGFloat = CONFIG.stage1.offset_to_buttom_percentage
//        
//        let up_height = otmp * view_frame.height
//        let mid_height = (otbp - otmp) * view_frame.height
//        let bottom_height = (1 - otbp) * view_frame.height
//        
//        return [up_height, mid_height, bottom_height]
//    }
//    
//    func view_origins() -> [CGPoint] {
//        let view_frame = self.view.frame
//        
//        let view_origin = view_frame.origin
//        
//        let otmp = CONFIG.offset_to_mid_percentage
//        let otbp = CONFIG.stage1.offset_to_buttom_percentage
//        
//        let up_origin = view_origin
//        let mid_origin = CGPoint(x: 0, y: otmp * view_frame.height)
//        let bottom_origin = CGPoint(x: 0, y: otbp * view_frame.height)
//        
//        return [up_origin, mid_origin, bottom_origin]
//    }
//    
//    func get_view_with_bg_color(_ origin: CGPoint, width: CGFloat, height: CGFloat, colors: [UIColor]) -> UIView {
//        
//        let size = CGSize(width: width, height: height)
//        let view_with_bg: UIView = UIView(frame: CGRect(origin: origin, size: size))
//        
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = view_with_bg.bounds
//        gradient.colors = [colors[0].cgColor, colors[1].cgColor]
//        
//        view_with_bg.layer.insertSublayer(gradient, at: 0)
//        
//        return view_with_bg
//    }
//}
//
//
//





















