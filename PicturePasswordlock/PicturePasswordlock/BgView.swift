//
//  BgView.swift
//  PicturePasswordlock
//
//  Created by Jason on 5/26/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class BgView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let image = UIImage(named: "Home_refresh_bg")
        
        image?.drawInRect(self.bounds)
    }


}
