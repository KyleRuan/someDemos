//
//  PanPasswordView.swift
//  PicturePasswordlock
//
//  Created by Jason on 5/26/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class PanPasswordView: UIView {
    
    lazy var selectedBtn:Array<UIButton> = {
      return []
    }()
    lazy var curP:CGPoint = {
        return  CGPointZero
    }()
    lazy var pan:UIPanGestureRecognizer = {
       return  UIPanGestureRecognizer(target: self, action: #selector(PanPasswordView.pan(_:)))
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        for i in 1...9{
            let btn = UIButton(type: UIButtonType.Custom)
            btn.setImage(UIImage(named: "gesture_node_normal"), forState: .Normal)
            btn.setImage(UIImage(named: "gesture_node_highlighted"), forState: .Selected)
            btn.tag = i
            btn.userInteractionEnabled = false
            self.addSubview(btn)
        }
        self.addGestureRecognizer(pan)
    }
    
    func pan(pan:UIPanGestureRecognizer)  {
        curP = pan.locationInView(self)
        if pan.state == .Ended {
             var str = ""
            for btn in selectedBtn {
                str += "\(btn.tag)"
            }
            print(str)
             setNeedsDisplay()
            selectedBtn.forEach({ (btn) in
                  btn.selected = false
            })
            selectedBtn.removeAll()
            return
        }
        
        for  views in self.subviews where views is UIButton {
            if   CGRectContainsPoint(views.frame, curP){
                if let btn = (views as? UIButton){
                    if !btn.selected {
                        btn.selected = true
                        selectedBtn.append(btn)
                    }
                }
            }
        }
        setNeedsDisplay()
    }
    
    
    override func layoutSubviews() {
        // 这里layoutsubViews
        // 3*3的排列
        // 图片是74*74
        let imageW:CGFloat = 74
        let count = self.subviews.count
        let col = 3
        let row = 3
        let offsetX = (self.bounds.width-CGFloat(col)*imageW)/CGFloat(col+1)
        let offsetY = (self.bounds.height-CGFloat(row)*imageW)/CGFloat(row+1)
        for   n in 0..<count {
         let   (i,j) = (n/row,n%row)
            let x = CGFloat(j+1)*offsetX+CGFloat(j)*imageW
            let y = CGFloat(i+1)*offsetY+CGFloat(i)*imageW
            self.subviews[n].frame = CGRectMake(x, y, imageW, imageW)
            
        }
        
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        if selectedBtn.count == 0 {
            return
        }
        let path = UIBezierPath()
        for i in  0..<selectedBtn.count {
            if i == 0 {
                path.moveToPoint(self.selectedBtn[i].center)
            }
            path.addLineToPoint(self.selectedBtn[i].center)
        }
            path.addLineToPoint(curP)
            path.lineWidth = 15
            path.lineJoinStyle = .Round
            path.lineCapStyle = .Round
            UIColor.greenColor().set()
            path.stroke()
    }
    

}
