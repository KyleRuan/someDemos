//
//  UIImage+border.swift
//  SettingView
//
//  Created by Jason on 5/22/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

import UIKit


extension UIImage {
   static func borderCircleImage(image:UIImage,borderWidth:CGFloat,borderColor:UIColor,size:CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), false, 0)

       
        let imageWH = image.size.width ;
        
        let ovalWH = imageWH+borderWidth*2
        
        UIGraphicsBeginImageContext(CGSizeMake(ovalWH, ovalWH))
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), false, 0)
    
       // 画头像的大圆
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, ovalWH, ovalWH))
        borderColor.set()
        path.fill()

                // 3.设置裁剪区域
        let clipPath = UIBezierPath(ovalInRect: CGRectMake(borderWidth, borderWidth, imageWH, imageWH))
        clipPath.addClip()
    
        image.drawAtPoint(CGPointMake(borderWidth, borderWidth))
        let clipImage = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
        return clipImage
    }
    
    static func scaleTosizeImage(image:UIImage,size:CGSize)->UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        
        
        let scaled = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaled
    }
    
}
