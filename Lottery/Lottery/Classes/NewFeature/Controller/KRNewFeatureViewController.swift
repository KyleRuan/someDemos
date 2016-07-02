//
//  KRNewFeatureViewController.swift
//  Lottery
//
//  Created by Jason on 16/6/30.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "NewFeatureCell"

class KRNewFeatureViewController: UICollectionViewController {
  
  var largeTitleImage:UIImageView!
  var smallTitleImage:UIImageView!
  var contentImage:UIImageView!
    var itemsCount = 4
  
  
  override init(collectionViewLayout layout: UICollectionViewLayout) {
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  convenience init() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = Constants.bounds.size
    layout.minimumLineSpacing = 0
    layout.scrollDirection = .Horizontal
    layout.minimumInteritemSpacing = 0
    self.init(collectionViewLayout: layout)
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.collectionView!.registerClass(KRNewFeatureViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    self.collectionView?.showsHorizontalScrollIndicator = false
    self.collectionView?.pagingEnabled = true
    self.collectionView?.bounces = false
    setUpCollectionView()
    // Do any additional setup after loading the view.
  }
  func setUpCollectionView()  {
   
    let imageBG = UIImage(named: "guideLine")
    let lineBackground = UIImageView(image: imageBG)
    lineBackground.frame.origin.x -= 200
    collectionView?.addSubview(lineBackground)
    contentImage =  UIImageView(image:UIImage(named: "guide1"))
    contentImage.center = self.view.center
    collectionView?.addSubview(contentImage)
    
    largeTitleImage =  UIImageView(image: UIImage(named: "guideLargeText1"))
    largeTitleImage.center = self.view.center
    largeTitleImage.frame.origin.y = self.view.frame.height*0.7
    collectionView?.addSubview(largeTitleImage)
    
    smallTitleImage = UIImageView(image: UIImage(named: "guideSmallText1"))
    smallTitleImage.center = self.view.center
    smallTitleImage.frame.origin.y =  largeTitleImage.frame.maxY+10
    collectionView?.addSubview(smallTitleImage)
    
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using [segue destinationViewController].
   // Pass the selected object to the new view controller.
   }
   */
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemsCount
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? KRNewFeatureViewCell else {
      return  KRNewFeatureViewCell()
    }
    cell.isLast = (indexPath.row == itemsCount-1)
    let imageBgName = "guide\(indexPath.row+1)Background"
    cell.image = UIImage(named: imageBgName)
    return cell
  }
  var lastOffsetX:CGFloat = 0
  override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    // scroll end
    let curOffsetX =  scrollView.contentOffset.x
    
    let delta = curOffsetX-lastOffsetX
    
    if delta == 0 {
      return
    }
    
    let num = Int(curOffsetX/Constants.bounds.width) + 1
    contentImage.image = UIImage(named: "guide\(num)")
    largeTitleImage.image = UIImage(named: "guideLargeText\(num)")
    smallTitleImage.image = UIImage(named: "guideSmallText\(num)")
    UIView.animateWithDuration(0.5) {
      self.contentImage.frame.origin.x += delta
      self.largeTitleImage.frame.origin.x += delta
      self.smallTitleImage.frame.origin.x += delta
    }
    lastOffsetX = curOffsetX
  }
}
