//
//  RKLabel.swift
//  网易主界面
//
//  Created by Jason on 16/7/5.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class RKLabel: UILabel {
  var red:CGFloat = 0.4
  var green:CGFloat = 0.6
  var blue:CGFloat = 0.7
  var originColor:UIColor!
  var scale:CGFloat!{
    didSet {
     setColorAndTransform()
    }
  }
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    originColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    self.textColor = originColor
//    self.layer.borderWidth = 1
//    self.layer.borderColor = UIColor.blueColor().CGColor
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func setColorAndTransform() {
    //
    //      R G B
    // 默认：0.4 0.6 0.7
    // 红色：1   0   0
    
     let redC = red + (1 - red) * scale;
     let greenC = green + (0 - green) * scale;
    let blueC = blue + (0 - blue) * scale;
    
    let transformScale = 1 + scale * 0.3; // [1, 1.3]
    self.transform = CGAffineTransformMakeScale(transformScale, transformScale);
    self.textColor = UIColor(red: redC, green: greenC, blue: blueC, alpha: 1)
    
    
    
  }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
