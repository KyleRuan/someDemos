//
//  ViewController.swift
//  网易主界面
//
//  Created by Jason on 16/7/5.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{
  
  @IBOutlet weak var titleScrollView: UIScrollView!
  @IBOutlet weak var contentScrollView: UIScrollView!
  
  var titles:Array<String>!
  var screenWidth = UIScreen.mainScreen().bounds.width
  lazy var  VCs:Array<SocialBaseViewController> = {
    return []
  }()
  
  lazy var labels:Array<RKLabel> = {
    return []
  }()
  var labelWidth:CGFloat = 90
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titles = ["天涯","life","国际","体育","社会","旅游","途牛"]
    setUpVCs()
    // 可以在storyboard中设置
    self.automaticallyAdjustsScrollViewInsets = false
    setUpTitle()
    self.contentScrollView.delegate = self
  }
  
  override func viewDidAppear(animated: Bool) {
     self.scrollViewDidEndDecelerating(contentScrollView)
  }
  
  func  setUpTitle() {
    let height = self.titleScrollView.frame.height
    let width =  labelWidth * CGFloat(titles.count)
    let contentSize = CGSizeMake(width, height)
    self.titleScrollView.contentSize = contentSize
    _ = titles.map { (title) -> Void in
      let count:CGFloat = CGFloat(titleScrollView.subviews.count)
      let frame = CGRectMake(labelWidth*count, 0, labelWidth, height)
      let label = RKLabel(frame: frame)
      label.text = title
      label.textAlignment = .Center
      let pan = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(_:)))
      label.tag = Int(count)
      label.addGestureRecognizer(pan)
      label.userInteractionEnabled = true
      labels.append(label)
      if count == 0 {
        label.scale = 1
      }
      titleScrollView.addSubview(label)
    }
    self.contentScrollView.contentSize = CGSizeMake(screenWidth * CGFloat(labels.count), 0)
  }
  
  
  func setUpVCs()  {
    _ = titles.map({ (title) -> Void in
      let vc = SocialBaseViewController(title: title)
      vc.view.backgroundColor = UIColor.grayColor()
      self.addChildViewController(vc)
      VCs.append(vc)
    })
  }
  
  func tap(tap:UITapGestureRecognizer)  {
    let tag = (tap.view as! UILabel).tag
    let offsetX = CGFloat(tag) * screenWidth
    self.contentScrollView.setContentOffset(CGPointMake(offsetX, 0), animated: true)
  }
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    let index = scrollView.contentOffset.x/screenWidth
    let offsetX = index * screenWidth
    let width = scrollView.frame.width
    var labelOffsetX = labels[Int(index)].center.x - width * 0.5
    if labelOffsetX < 0 {
      labelOffsetX = 0
    }
    
    let maxOffsetX  = self.titleScrollView.contentSize.width - width
    if labelOffsetX > maxOffsetX {
      labelOffsetX = maxOffsetX
    }
    titleScrollView.setContentOffset(CGPointMake(labelOffsetX, 0), animated: true)
    let showVC = VCs[Int(index)]
    showVC.view.frame = CGRectMake(offsetX, 0, screenWidth, contentScrollView.frame.height)
    self.contentScrollView.tintAdjustmentMode = .Normal
    self.contentScrollView.addSubview(showVC.view)
    UIView.animateWithDuration(0.5) {
      self.contentScrollView.contentOffset.x = offsetX
    }
    
  }
  
  func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
    self.scrollViewDidEndDecelerating(scrollView)
    let index = Int(scrollView.contentOffset.x / screenWidth)
     _ = labels.map { (label) -> Void in
      if label == labels[index] {
        return
      }
      label.textColor = label.originColor
    }
  }

  func scrollViewDidScroll(scrollView: UIScrollView) {
    // index 是左边的下标
      let scale = scrollView.contentOffset.x/screenWidth
    if (scale < 0 || scale > CGFloat(self.titleScrollView.subviews.count - 1)){
      return
    }
    let left = Int(scale)
    let leftLabel = labels[left]
    if left+1 >= labels.count {
      return
    }
    let rightLabel = labels[left+1]
    let rightScale =  scale - CGFloat(left)
    let  leftScale = 1 - rightScale
    leftLabel.scale = leftScale
    rightLabel.scale = rightScale
  }
}

