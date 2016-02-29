//
//  MaskView.swift
//  fillTheKettle
//
//  Created by Jason on 16/2/23.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit

class MaskView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    private let kImageViewWidth:CGFloat = 104.0
    private let kImageViewHeight:CGFloat = 157.0
    var isAnimation:Bool = false
    
    var maskLayer = CAShapeLayer()
    
    let foregroundImageView = UIImageView(image: UIImage(named: "group2"))
    let backgroundImageView = UIImageView(image: UIImage(named: "group1"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let path = UIBezierPath(rect: frame)
        maskLayer.path = path.CGPath
//        maskLayer.frame = frame
        
    
    backgroundImageView.frame = CGRectMake(0, self.bounds.width/2, kImageViewWidth, kImageViewHeight)
        
        self.addSubview(backgroundImageView)
        
        foregroundImageView.frame = CGRectMake(0, self.bounds.width/2, kImageViewWidth, kImageViewHeight)
        foregroundImageView.layer.mask = maskLayer
        self.addSubview(foregroundImageView)
    }
    
    
    func startAnimation(){
        isAnimation = true
    

        
   
        
        let fromPath = UIBezierPath(rect: self.bounds).CGPath
        let toPath = UIBezierPath(rect: CGRectMake(0, 0, kImageViewWidth, 0)).CGPath
        
//        let keyAnimation = CAKeyframeAnimation(keyPath: "path")
//        keyAnimation.values = [fromPath,toPath]
//        keyAnimation.duration = 5
//        keyAnimation.speed = 1
        let  animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = fromPath
        animation.toValue = toPath
        animation.removedOnCompletion = false
        animation.duration = 5
        animation.fillMode = kCAFillModeForwards
        maskLayer.removeAllAnimations()
        maskLayer.path = fromPath
        maskLayer.speed = 1
        maskLayer.addAnimation(animation, forKey: "maskAnimation")
//        maskLayer.path = toPath
    }
    
    func pauseAnimation(){
        
        isAnimation = false
        //下面这种做法会导致再次终止时候结束，需要转换到子时间空间中来
//        maskLayer.timeOffset = CACurrentMediaTime()

        let paused =  maskLayer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        
        maskLayer.timeOffset = paused
        
        maskLayer.speed = 0
     
        
    }
    
    func resumeAnimation(){
        if isAnimation{
            return
        }
         let pausedTime = maskLayer.timeOffset
        
        maskLayer.beginTime = 0
      
        maskLayer.timeOffset = 0
        
          maskLayer.speed = 1
       let paused =  maskLayer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pausedTime
          maskLayer.beginTime = paused
        
        isAnimation = true
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
