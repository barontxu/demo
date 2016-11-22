//
//  AnimeLayer.swift
//  anime
//
//  Created by mmxs47 on 16/8/28.
//  Copyright © 2016年 mmxs47. All rights reserved.
//





/*  使用说明：
  使用此动画，在目标视图的layer中加入此类实例，再调用设置函数进行设置（不设置即取默认值）。
  设置接口：
 
        setAnimeCenterX
        setLargeCircleCenterY
        setLargeCircleRadius
        setSmallCircleCenterY
        setSmallCircleRadius
 
  这里largeCircle指代屏幕上方的圆，smallCircle指代下方。
 
       具体例子见TestView.swift
*/




import UIKit

typealias CP = CGPoint

class ButtonAnimeLayer: CAShapeLayer {
    
    fileprivate let FrameWidth: CGFloat = 268.0
    
    fileprivate var superRect: CGRect!
    
    fileprivate var paths: [CGPath] = []

    fileprivate var animationDuration: CFTimeInterval!
    
    fileprivate var animeCenterX: CGFloat! // 动画中心位置水平分量，取值0～1， 0为目标视图左边界，1为右边界。
    
    fileprivate var largeCircleCenterY: CGFloat! // 大圆中心位置垂直分量，取值0～1， 0为目标视图上边界，1为下边界。
    
    fileprivate var largeCircleRadius: CGFloat! // 大圆半径，取值0～1， 1为半个横屏幕距离。
    
    fileprivate var smallCircleCenterY: CGFloat! // 小圆中心位置垂直分量，取值0～1， 0为目标视图上边界，1为下边界。
    
    fileprivate var smallCircleRadius: CGFloat! // 小圆半径，取值0～1， 1为半个横屏幕距离。
    
    fileprivate var animeCenter: CGPoint {
        let rect = self.superRect
        let center = CGPoint(x: (rect?.size.width)! * animeCenterX , y: (rect?.size.height)! * (largeCircleCenterY + smallCircleCenterY) / 2)
        return center
    }
    
    // 用计算变量进行简单的数据转换，转换至FrameWidth下的坐标。
    fileprivate var largeCircleCenterYToFrameWidth: CGFloat {
        return (largeCircleCenterY - smallCircleCenterY) / 2 * superRect.size.height / superRect.size.width * FrameWidth
    }
    
    fileprivate var largeCircleRadiusToFrameWidth: CGFloat {
        return largeCircleRadius / 2 * FrameWidth
    }
    
    fileprivate var smallCircleCenterYToFrameWidth: CGFloat {
        return (smallCircleCenterY - largeCircleCenterY) / 2 * superRect.size.height / superRect.size.width * FrameWidth
    }
    
    fileprivate var smallCircleRadiusToFrameWidth: CGFloat {
        return smallCircleRadius / 2 * FrameWidth
    }

    // 以下为设置接口，超界时设为标准动画。
    
    func setAnimeCenterX(_ x: CGFloat) {
        if(x>=0 && x<=1) {
            animeCenterX = x
        } else {
            standardAnimeSet()
        }
        judge()
    }// 动画中心位置水平分量，取值0～1， 0为目标视图左边界，1为右边界。
    
    func setLargeCircleCenterY(_ y: CGFloat) {
        if(y>=0 && y<=1) {
            largeCircleCenterY = y
        } else {
            standardAnimeSet()
        }
        judge()
    }// 大圆中心位置垂直分量，取值0～1， 0为目标视图上边界，1为下边界。
    
    func setLargeCircleRadius(_ radius: CGFloat) {
        if(radius>0 && radius<=1) {
            largeCircleRadius = radius
        } else {
            standardAnimeSet()
        }
        judge()
    }// 大圆半径，取值0～1， 1为半个横屏幕距离。
    
    func setSmallCircleCenterY(_ y: CGFloat) {
        if(y>=0 && y<=1) {
            smallCircleCenterY = y
        } else {
            standardAnimeSet()
        }
        judge()
    }// 小圆中心位置垂直分量，取值0～1， 0为目标视图上边界，1为下边界。
    
    func setSmallCircleRadius(_ radius: CGFloat) {
        if(radius>0 && radius<=1) {
            smallCircleRadius = radius
        } else {
            standardAnimeSet()
        }
        judge()
    }// 小圆半径，取值0～1， 1为半个横屏幕距离。
    
    fileprivate func judge() {
        if(largeCircleCenterY<smallCircleCenterY) {
            setPaths()
        }
    }
    
/*
 注意：这里小圆默认在屏幕下方，大圆在上方。若将两圆位置设反，视为超界。
*/
    
    
    // 设置动画持续时间，输入负值会设为默认值0.5。
    func setAnimeDuration(_ durationTime: CFTimeInterval) {
        let time = durationTime > 0 ? durationTime : 0.5
        animationDuration = time
        setPaths()
    }
    
    // 标准动画设置信息
    fileprivate func standardAnimeSet() {
        animationDuration = 0.5
        animeCenterX = 0.5
        largeCircleCenterY = 0.5 - (59 / FrameWidth * superRect.size.width / superRect.size.height)
        largeCircleRadius = 70 / FrameWidth * 2
        smallCircleCenterY = 0.5 + (59 / FrameWidth * superRect.size.width / superRect.size.height)
        smallCircleRadius = 49 / FrameWidth * 2
        
        fillColor = UIColor.green.cgColor
        strokeColor = UIColor.white.cgColor
        lineWidth = 3
    }

    init(superRect: CGRect) {
        super.init()
        self.superRect = superRect
        standardAnimeSet()

        setPaths()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // 生成圆，输入的参数（坐标）以视图宽268为比例基准，以animeCenter为原点。
    fileprivate func createCircular(positionY: CGFloat, radius: CGFloat, pathElementAngle1: CGFloat, pathElementAngle2: CGFloat) -> UIBezierPath {
        
        let transRatio = superRect.size.width / FrameWidth
        
        let positionYCG = positionY * transRatio
        let radiusCG = radius * transRatio
        
        let circular = UIBezierPath()
        let circularCenter = CGPoint(x: animeCenter.x, y: animeCenter.y + positionYCG)
        
        let startAngels = [CGFloat(M_PI/2), pathElementAngle1, pathElementAngle2, CGFloat(M_PI*3/2), CGFloat(M_PI*3) - pathElementAngle2, CGFloat(M_PI*3) - pathElementAngle1]
        
        let endAngels = [pathElementAngle1, pathElementAngle2, CGFloat(M_PI*3/2), CGFloat(M_PI*3) - pathElementAngle2, CGFloat(M_PI*3) - pathElementAngle1, CGFloat(M_PI*5/2)]
        
        for (index, start_angel) in startAngels.enumerated() {
            circular.addArc(withCenter: circularCenter, radius: radiusCG, startAngle: start_angel, endAngle: endAngels[index], clockwise: true)
        }
        circular.close()
        
        return circular
    }
    
    // 辅助计算函数，计算point1 point2连线 与 point3 point4 连线的交点。
    fileprivate func crossPoint(_ point1: CGPoint, point2: CGPoint, point3: CGPoint, point4: CGPoint) -> CGPoint {
        let k1 = (point1.y - point2.y) / (point1.x - point2.x)
        let b1 = point1.y - k1 * point1.x
        
        let k2 = (point3.y - point4.y) / (point3.x - point4.x)
        let b2 = point3.y - k2 * point3.x
        
        let point = CGPoint(x: (b1 - b2) / (k2 - k1), y: (k2 * b1 - k1 * b2) / (k2 - k1))
        return point
    }
    

    // 生成中间态的函数，输入的参数（坐标）以视图宽268为比例基准，以animeCenter为原点。
    fileprivate func createStatus(controlPoint1: CGPoint, controlPoint2: CGPoint, point1: CGPoint, point2: CGPoint) -> UIBezierPath {
        
        let transRatio = superRect.size.width / FrameWidth
        
        let controlPointCG1 = CGPoint(x: controlPoint1.x * transRatio, y: controlPoint1.y * transRatio)
        let controlPointCG2 = CGPoint(x: controlPoint2.x * transRatio, y: controlPoint2.y * transRatio)
        let pointCG1 = CGPoint(x: point1.x * transRatio, y: point1.y * transRatio)
        let pointCG2 = CGPoint(x: point2.x * transRatio, y: point2.y * transRatio)
        let cross = crossPoint(controlPointCG1, point2: pointCG1, point3: controlPointCG2, point4: pointCG2)
        
        let status = UIBezierPath()
        
        let startPoint = CGPoint(x: animeCenter.x, y: animeCenter.y + controlPointCG1.y)
        
        status.move(to: startPoint)
        let endPoint1 = CGPoint(x: animeCenter.x + pointCG1.x, y: animeCenter.y + pointCG1.y)
        let controlP1 = CGPoint(x: animeCenter.x + controlPointCG1.x, y: animeCenter.y + controlPointCG1.y)
        status.addQuadCurve(to: endPoint1, controlPoint: controlP1)
        
        status.addLine(to: status.currentPoint)
        let endPoint2 = CGPoint(x: animeCenter.x + pointCG2.x, y: animeCenter.y + pointCG2.y)
        let controlP2 = CGPoint(x: animeCenter.x + cross.x, y: animeCenter.y + cross.y)
        status.addQuadCurve(to: endPoint2, controlPoint: controlP2)
        
        status.addLine(to: status.currentPoint)
        let endPoint3 = CGPoint(x: animeCenter.x, y: animeCenter.y + controlPointCG2.y)
        let controlP3 = CGPoint(x: animeCenter.x + controlPointCG2.x, y: animeCenter.y + controlPointCG2.y)
        status.addQuadCurve(to: endPoint3, controlPoint: controlP3)
        
        status.addLine(to: status.currentPoint)
        let endPoint4 = CGPoint(x: animeCenter.x - pointCG2.x, y: animeCenter.y + pointCG2.y)
        let controlP4 = CGPoint(x: animeCenter.x - controlPointCG2.x, y: animeCenter.y + controlPointCG2.y)
        status.addQuadCurve(to: endPoint4, controlPoint: controlP4)
        
        status.addLine(to: status.currentPoint)
        let endPoint5 = CGPoint(x: animeCenter.x - pointCG1.x, y: animeCenter.y + pointCG1.y)
        let controlP5 = CGPoint(x: animeCenter.x - cross.x, y: animeCenter.y + cross.y)
        status.addQuadCurve(to: endPoint5, controlPoint: controlP5)
        
        status.addLine(to: status.currentPoint)
        let endPoint6 = startPoint
        let controlP6 = CGPoint(x: animeCenter.x - controlPointCG1.x, y: animeCenter.y + controlPointCG1.y)
        status.addQuadCurve(to: endPoint6, controlPoint: controlP6)
        
        status.close()
        
        return status
    }
    
    // 辅助计算函数，计算等比点
    fileprivate func proportionPoint(point1: CP, point2: CP, point3: CP, point4: CP, point5: CP) -> CP {
        let pointX = (point2.x - point1.x) / (point3.x - point1.x) * (point5.x - point4.x) + point4.x
        let pointY = (point2.y - point1.y) / (point3.y - point1.y) * (point5.y - point4.y) + point4.y
        return CP(x: pointX, y: pointY)
    }
    
    // 辅助细节调整函数
    fileprivate func helpToAdjust(smallRadiusRatio: CGFloat, largeRadiusRatio: CGFloat, state: [CP]) -> [CP] {
        var result: [CP] = state
        
        let center = CP(x: 0, y: (state[0].y + state[1].y) / 2)
        
        let crossBefore = crossPoint(state[0], point2: state[2], point3: state[1], point4: state[3])
        
        let crossSecondBefore = crossPoint(state[0], point2: state[1], point3: center, point4: crossBefore)
        
        result[0] = CP(x: state[0].x * smallRadiusRatio, y: (state[0].y - center.y) * smallRadiusRatio + center.y)
        result[1] = CP(x: state[1].x * smallRadiusRatio, y: (state[1].y - center.y) * smallRadiusRatio + center.y)
        
        let crossSecondAfter = crossPoint(result[0], point2: result[1], point3: center, point4: crossBefore)
        
        let crossAfter = proportionPoint(point1: center, point2: crossBefore, point3: crossSecondBefore, point4: center, point5: crossSecondAfter)
        
        
        result[2] = proportionPoint(point1: state[0], point2: state[2], point3: crossBefore, point4: result[0], point5: crossAfter)
        result[3] = proportionPoint(point1: state[1], point2: state[3], point3: crossBefore, point4: result[1], point5: crossAfter)
        
        return result
    }
    
    // 把通过缩放两圆距离后得到的中间态调整为适合当前两圆大小的新中间态。
    fileprivate func adjustState(_ state: [CP]) -> [CP] {
        var firstResult: [CP] = []
        var lastResult: [CP] = []
        
        // 现两圆距离与标准状态两圆距离比
        let distanceRatio = (smallCircleCenterYToFrameWidth - largeCircleCenterYToFrameWidth) / (59 * 2)
        // 现大圆半径与缩放后标准大圆半径比
        let largeRadiusRatio = largeCircleRadiusToFrameWidth / (70 * distanceRatio)
        // 现小圆半径与缩放后标准小圆半径比
        let smallRadiusRatio = smallCircleRadiusToFrameWidth / (49 * distanceRatio)
        
        // 通过distanceRatio把标准状态下的中间态缩放成当前下的中间态
        for point in state {
            firstResult.append(CP(x: point.x * distanceRatio, y: point.y * distanceRatio))
        }
        // 再次进行细节调整
        lastResult = helpToAdjust(smallRadiusRatio: smallRadiusRatio, largeRadiusRatio: largeRadiusRatio, state: firstResult)
        
        return lastResult
    }
    
    
    fileprivate func setPaths() {
        
        let start_path = createCircular(positionY: smallCircleCenterYToFrameWidth, radius: smallCircleRadiusToFrameWidth, pathElementAngle1: CGFloat(M_PI), pathElementAngle2: CGFloat(M_PI*5/4))// 59 49
        
        var paths = [start_path.cgPath]
        
        let state1 = [CP(x: -48, y: 91), CP(x: -18, y: -27), CP(x: -32, y: 34), CP(x: -21, y: -7)]
        let state2 = [CP(x: -34, y: 80), CP(x: -20, y: -50), CP(x: -17, y: 15), CP(x: -15, y: -23)]
        let state3 = [CP(x: -12, y: 55), CP(x: -43, y: -80), CP(x: -9, y: 39), CP(x: -16, y: -13)]
        let state4 = [CP(x: -18, y: 31), CP(x: -60, y: -102), CP(x: -21, y: 18), CP(x: -36, y: -36)]
        
        var middle_states = [state1, state2, state3, state4]
        // 调整中间态 e
        middle_states = middle_states.map(adjustState)
        
        for points in middle_states {
            let path = createStatus(controlPoint1: points[0], controlPoint2: points[1], point1: points[2], point2: points[3])
            paths.append(path.cgPath)
        }
        
        let end_path = createCircular(positionY: largeCircleCenterYToFrameWidth, radius: largeCircleRadiusToFrameWidth, pathElementAngle1: CGFloat(M_PI*3/4), pathElementAngle2: CGFloat(M_PI))// -59 70
        
        paths.append(end_path.cgPath)
        
        self.paths = paths
        
        path = paths[0]
    }
    
    
    // 动画部分
    fileprivate func do_anime(_ reverse: Bool){
        let animeGroup = CAAnimationGroup()
        animeGroup.animations = []
        let base_duration = animationDuration / 18
        let bd = base_duration
        var durations = [bd * 4.2, bd * 2.8, bd * 4, bd * 3.0, bd * 4.0]
        var paths_for_now = paths
        if reverse {
            durations = durations.reversed()
            paths_for_now = paths.reversed()
        } else {
            paths_for_now = paths
        }
        path = paths_for_now[0]
        var begin_time: CFTimeInterval = 0.0
        
        for (index, path_tmp) in paths_for_now.enumerated() {
            if index == paths_for_now.count - 1 {
                break
            }
            let anime : CABasicAnimation = CABasicAnimation(keyPath: "path")
            anime.fromValue = path_tmp
            anime.toValue = paths_for_now[index+1]
            anime.beginTime = begin_time
            anime.duration = durations[index]
            begin_time += durations[index]
            anime.fillMode = kCAFillModeForwards
            anime.isRemovedOnCompletion = false
            animeGroup.animations?.append(anime)
        }
        
        animeGroup.duration = begin_time
        animeGroup.fillMode = kCAFillModeForwards
        
        add(animeGroup, forKey: nil)
        
        path = paths_for_now[paths_for_now.count-1]
        
    }
    
    func anime() {
        do_anime(false)
    }
    
    func animeReverse() {
        do_anime(true)
    }
}
