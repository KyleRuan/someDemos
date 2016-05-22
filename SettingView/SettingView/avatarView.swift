//
//  avatarView.swift
//  SettingView
//
//  Created by Jason on 5/22/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class avatarView: UIView {
    
//    let screenW = UIScreen.mainScreen().bounds.width
    let screenH = UIScreen.mainScreen().bounds.height
    //
    
    var ImageBG:UIImage!{
        didSet{
            setNeedsDisplay()
        }
    }
    var avatarRadius:CGFloat = 40{
        didSet{
            addAvatar()
        }
    }
    var borderColor = UIColor.blueColor()
    var borderWidth:CGFloat = 2{
        didSet{
            addAvatar()
        }
    }
    var avatar:UIImage!{
        didSet{
            addAvatar()
        }
    }
    
  override  init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(frame:CGRect,backgroundImage:UIImage,avatarImage:UIImage) {
        self.init(frame: frame)
        ImageBG = backgroundImage
        avatar = avatarImage
        addAvatar()
    }
    
    private func addAvatar() {
         let imageViewSizeX = UIScreen.mainScreen().bounds.midX-(avatarRadius+borderWidth)
//         let imageViewSizeY = self.bounds.maxY
        let imageView = UIImageView(frame: CGRectMake(imageViewSizeX, self.bounds.maxY-(avatarRadius+borderWidth),2*(avatarRadius+borderWidth), 2*(avatarRadius+borderWidth)))
        let scaleImgae = UIImage.scaleTosizeImage(avatar, size: CGSizeMake(avatarRadius*2,avatarRadius*2))
        let avatars = UIImage.borderCircleImage(scaleImgae, borderWidth: borderWidth, borderColor:borderColor,size: CGRectMake(0,0,avatarRadius*2,avatarRadius*2))
        imageView.image = avatars
        self.clipsToBounds = false
        self.addSubview(imageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        if ImageBG == nil {
            // backgroundView
             ImageBG = UIImage(named: "BGimage")
        }
        
      
            ImageBG?.drawInRect(self.bounds)
    }
    

}
