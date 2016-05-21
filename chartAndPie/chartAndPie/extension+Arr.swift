//
//  extension+Arr.swift
//  chartAndPie
//
//  Created by Jason on 5/21/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

import UIKit


extension CGFloat {
   static  func randomCGFloat(count:Int) ->Array<CGFloat> {
        
        var dataSource:Array<CGFloat> = []
        for _ in 0..<count {
            let num = CGFloat(arc4random()%101)
            dataSource.append(num)
        }
        return dataSource
    
    }

}




extension UIColor {
    static func randomColor()->UIColor {
        let r = CGFloat(arc4random_uniform(256))/255.0
        let g = CGFloat(arc4random_uniform(256))/255.0
        let b = CGFloat(arc4random_uniform(256))/255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}