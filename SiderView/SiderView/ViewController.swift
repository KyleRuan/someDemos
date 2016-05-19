//
//  ViewController.swift
//  SiderView
//
//  Created by Jason on 16/5/19.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//


import UIKit

struct Constant {
    static let screenW = UIScreen.mainScreen().bounds.width
    static let screenH = UIScreen.mainScreen().bounds.height
    static let marginTop:CGFloat = 80
    static let margin:CGFloat = 300
    
}


class ViewController: UIViewController {
    
    var mainView:UIView! = UIView()
    var left:UIView! = UIView()
    var right:UIView! = UIView()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.pan))
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap))
        self.view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(pan)
        
        
        let vc = MainViewController() ;
        vc.view.frame = self.view.bounds
        vc.view.backgroundColor = UIColor.brownColor()
        mainView.addSubview(vc.view)
        // 这一步是必须的
        self.addChildViewController(vc)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tap() {
        if mainView.frame.origin.x != 0 {
            let offSetX = -mainView.frame.origin.x ;
            UIView.animateWithDuration(0.25, animations: {
                self.mainView.frame = self.setFrame(offSetX)
            })
        }
    }
    func pan(pan:UIPanGestureRecognizer )  {
        
        
        let pos = pan.translationInView(mainView)
        mainView.frame = setFrame(pos.x)
        pan.setTranslation(CGPointZero, inView: mainView)
        
        
        
        
        // 只考虑一边的情况
        
        //         ---> you
        
        // x<-width/2
        // -width/2 <x< width/2    originx = 0
        
        // 2 x > -width/2
        
        if pan.state == .Ended {
            var target:CGFloat = 0
            if mainView.frame.origin.x > Constant.screenW/2 {
                target = Constant.margin
            }else if (mainView.frame.origin.x < -Constant.screenW/2) {
                target = -Constant.margin
            }
            let offSetX =   target - self.mainView.frame.origin.x
            UIView.animateWithDuration(0.25, animations: {
                self.mainView.frame = self.setFrame(offSetX)
            })
        }
        
        
        
        
    }
    private func setFrame(offsetX:CGFloat) ->CGRect {
        let X = mainView.frame.origin.x + offsetX
        let  offSetY =  offsetX*Constant.marginTop/Constant.screenW
        var h = mainView.frame.height-2*offSetY
        if  mainView.frame.origin.x<0 {
            right.alpha = 1
            h = mainView.frame.height + 2 * offSetY;
            
        }else{
            right.alpha = 0
            
        }
        
        // 获取当前的宽度 保持长宽一致
        let scale = h / mainView.frame.height;
        let w = mainView.frame.width * scale;
        // 获取当前Y
        let Y = (Constant.screenH - h) / 2;
        let frame = CGRectMake(X, Y, w, h)
        
        
        return frame
        
    }
    
    func setUpViews()  {
        left = UIView(frame: self.view.bounds)
        left.backgroundColor =  UIColor.redColor()
        self.view.addSubview(left)
        
        right = UIView(frame: self.view.bounds)
        right.backgroundColor =  UIColor.blueColor()
        self.view.addSubview(right)
        
        
        mainView = UIView(frame: self.view.bounds)
        mainView.backgroundColor =  UIColor.yellowColor()
        self.view.addSubview(mainView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

