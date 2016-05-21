//
//  chart.swift
//  chartAndPie
//
//  Created by Jason on 5/21/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class chart: UIView {

    
    var dataSource:Array<CGFloat> = []
    
override    init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        dataSource = CGFloat.randomCGFloat(3)
        
        
       let total = dataSource.reduce(0) { (res, item) -> CGFloat in
            return res+item
        }
        
        let width = self.frame.width/CGFloat(dataSource.count*2-1)
        
        var x:CGFloat = 0
        for data in dataSource {
            
            // total 100 
            
            let percentage = data/total ;
            let height = percentage*self.frame.height ;
            let y = self.frame.height - height
            
            let path = UIBezierPath(rect: CGRectMake(x, y, width, height))
            
            UIColor.randomColor().set()
            
            path.fill()
             x += width*2
        }
        
        
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.setNeedsDisplay()
    }
    

}
