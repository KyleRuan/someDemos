//
//  UIImage+Extension.swift
//  Lottery
//
//  Created by Jason on 16/6/28.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

extension UIImage {
  
 class func renderOriginlImage(imageName:String) -> UIImage? {
   return (UIImage(named:imageName)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))

  }
  

  
}
