//
//  DrawPie.swift
//  chartAndPie
//
//  Created by Jason on 16/5/20.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class DrawPie: UIView {
    var dataSource:Array<CGFloat> = []
    
    
    override init(frame: CGRect) {
//        print(frame)
        super.init(frame: frame)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        dataSource = [] ;
        super.init(coder: aDecoder)
        
        
//        fatalError("init(coder:) has not been implemented")
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        // for test
//        if dataSource.count == 0 {
//            randonDataSource()
//        }
        
        
        dataSource = CGFloat.randomCGFloat(5)
        
       let total = dataSource.reduce(0) { (res, d) -> CGFloat in
            return res+CGFloat(d)
        }
        
        var startA:CGFloat = 0;
        var endA:CGFloat = 0 ;
        
        let center = CGPointMake(self.frame.width/2, self.frame.height/2);
        
        
        let radius = min(self.frame.width/2, self.frame.height/2)
        
        
       
        
        for data in dataSource {
            
            endA = CGFloat(data)/total*CGFloat(2 * M_PI)+startA
            print(CGFloat(data)/total)
            let  path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startA, endAngle: endA, clockwise: true)
            path.addLineToPoint(center)
          
//            randomColor().set()
            UIColor.randomColor().set()
            path.fill()
              startA = endA
        }
        
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.setNeedsDisplay()
    }
//    
//    
//    private func randomColor()->UIColor{
//        let r = CGFloat(arc4random_uniform(256))/255.0
//        let g = CGFloat(arc4random_uniform(256))/255.0
//        let b = CGFloat(arc4random_uniform(256))/255.0
//        return UIColor(red: r, green: g, blue: b, alpha: 1)
//    }
//    
//    
//    private func randonDataSource(count:Int = 5) {
//        
//        
//        for _ in 0..<count {
//            let num:Int = Int(arc4random()%101)
//            dataSource.append(num)
//        }
//    }
    

}
