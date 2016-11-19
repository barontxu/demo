//
//  ValueSetter.swift
//  demotest
//
//  Created by zizhe on 18/11/2016.
//  Copyright © 2016 zizhe. All rights reserved.
//

import UIKit

class ValueSetter: UIView {

    var type_text           : String!
    var value_text          : String!
    
    var value_label         : UILabel!
    var type_label          : UILabel!
    
    var need_top_line       : Bool!
    var need_bottom_line    : Bool!
    
    init (frame: CGRect, type: String, need_top_line: Bool, need_bottom_line: Bool) {
        self.type_text = type
        self.need_top_line = need_top_line
        self.need_bottom_line = need_bottom_line
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        
        var lineView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 1.0))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.gray.cgColor
        
        if need_top_line! {
            self.addSubview(lineView)
        }
        
        type_label = UILabel(frame: CGRect(x: 100, y: 7, width: 400, height: 30))
        type_label.font = UIFont.systemFont(ofSize: 15)
        type_label.text = type_text
        type_label.textColor = UIColor.white
        self.addSubview(type_label)
        
        value_label = UILabel(frame: CGRect(x: 100, y: 34, width: 400, height: 30))
        value_label.font = UIFont.systemFont(ofSize: 10)
        value_label.text = "100"
        value_label.textColor = UIColor.white
        self.addSubview(value_label)
        
        print(bounds.height)
        var lineViewBottom = UIView(frame: CGRect(x: 20, y: bounds.height+1, width: bounds.width-40, height: 1.0))
        lineViewBottom.layer.borderWidth = 1.0
        lineViewBottom.layer.borderColor = UIColor.gray.cgColor
        
        if need_bottom_line! {
            self.addSubview(lineViewBottom)
        }
        
    }
    
    func updateValue(_ value: CGFloat){
        value_text = String(format: "%.1f", value)
        if value_label != nil {
            value_label.text = value_text
        }
        setNeedsDisplay()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
