//
//  ComponnetViewController.swift
//  loadingVIEW
//
//  Created by Jason on 16/6/27.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class ComponnetViewController: UIViewController {
  
  var  items:Array<Item>!
  var cols = 3
  var timer:NSTimer!
  var time:Int = 0
  var itemsBtn:Array<itemView> = []
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpItems()
//     #selector(ComponnetViewController.timeChage)
     timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ComponnetViewController.timeChange), userInfo: nil, repeats: true)
    // Do any additional setup after loading the view.
    let back = UIButton(frame: CGRectMake(0,0,100,100))
    back.addTarget(self, action: #selector(ComponnetViewController.back), forControlEvents: UIControlEvents.TouchUpInside)
    back.setTitle("back", forState: UIControlState.Normal)
    back.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    self.view.addSubview(back)
  }
  
  
  func back()   {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  func timeChange()  {
    if time == items.count {
      timer.invalidate()
      return
    }
    setUpAllAnimation(itemsBtn[time])
    time = time + 1
  }
  
  
  func setUpAllAnimation(btn:itemView)  {
    UIView.animateWithDuration(0.8) {
      btn.transform = CGAffineTransformIdentity
    }
  }
  
  
  
  func setUpItems()  {
    //
    let count = items.count
    let itemW:CGFloat = 100
    let offsetY:CGFloat = 300
    let spacing = (UIScreen.mainScreen().bounds.width-CGFloat(cols)*itemW)/CGFloat(cols+1)
    for i in 0..<count {
      let col = i%cols
      let row = i/cols
      let frame = CGRectMake((spacing+itemW)*CGFloat(col+1)-itemW, (itemW+spacing)*CGFloat(row)+offsetY, itemW, itemW)
      let button =  itemView(frame: frame)
      button.imageView?.image = UIImage(named: items[i].imagePath)
      button.setTitle(items[i].title, forState: UIControlState.Normal)
      button.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)
      button.addTarget(self, action: #selector(ComponnetViewController.itemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
       itemsBtn.append(button)
      self.view.addSubview(button)
    }
    
  }
  
  func itemAction(btn:UIButton)  {
    print(btn.titleLabel?.text)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
