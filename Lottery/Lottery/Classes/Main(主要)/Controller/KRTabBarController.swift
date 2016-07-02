//
//  KRTabBarController.swift
//  Lottery
//
//  Created by Jason on 16/6/28.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRTabBarController: UITabBarController ,KRTabBarViewDelegate{
  lazy var controllers:Array<SubControllerItem> = {
    return []
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpControllers()
    setUpTabBar()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    for  view in self.tabBar.subviews {
      if !(view is KRTabBarView) {
        view.removeFromSuperview()
        
      }
    }
  }
  func setUpTabBar()  {
    
    let  tabBars = KRTabBarView()
    tabBars.delegate = self
    tabBars.items = controllers
    tabBars.frame = self.tabBar.bounds
    self.tabBar.addSubview(tabBars)
  }
  
  
  
  func setUpControllers() {
    // set the Controller
    //1 配置的信息有tabbarItem Image and the imgae
    
    // 购彩大厅
    let hall = KRHallViewController()
    guard let hallImage = UIImage(named: "TabBar_LotteryHall_new"),let hallSeletedImage = UIImage(named: "TabBar_LotteryHall_selected_new") else {
      return
    }
    self.addController(hall, image: hallImage, selectedImage: hallSeletedImage,title: "购彩大厅")
    
    // 竞技场
    let arena = KRArenaViewController()
    guard let arenaImage = UIImage(named: "TabBar_Arena_new"),let arenaSeletedImage = UIImage(named: "TabBar_Arena_selected_new") else {
      return
    }
    self.addController(arena, image: arenaImage, selectedImage: arenaSeletedImage,title: "竞技场")
    
    //发现
    //    let discover = KRDiscoverController()
    var st = UIStoryboard(name: "KRDiscoverController", bundle: nil)
    
    let discover = st.instantiateInitialViewController()!
    
    guard let discoveryImage = UIImage(named: "TabBar_Discovery_new"),let discoverySeletedImage = UIImage(named: "TabBar_Discovery_selected_new") else {
      return
    }
    //    discover.view.backgroundColor = UIColor.yellowColor()
    self.addController(discover, image: discoveryImage, selectedImage: discoverySeletedImage,title: "发现")
    
    
    // 中奖信息
    let history = KRHistoryViewController()
    guard let historyImage = UIImage(named: "TabBar_History_new"),let historySeletedImage = UIImage(named: "TabBar_History_selected_new") else {
      return
    }
    history.view.backgroundColor = UIColor.greenColor()
    self.addController(history, image: historyImage, selectedImage: historySeletedImage,title: "中奖信息")
    
    
    
    //我的彩票
    st = UIStoryboard(name: "KRMyLotteryViewController", bundle: nil)
    let myLottery = st.instantiateInitialViewController()!
    guard let lotteryImage = UIImage(named: "TabBar_MyLottery_new"),let lotterySeletedImage = UIImage(named: "TabBar_MyLottery_selected_new") else {
      return
    }
    
    self.addController(myLottery, image: lotteryImage, selectedImage: lotterySeletedImage,title: "我的彩票")
  }
  func addController(vc:UIViewController,image:UIImage,selectedImage:UIImage,title:String)  {
    let item = SubControllerItem(tabBarImage: image, selectedImage: selectedImage)
    
    controllers.append(item)
    
    vc.tabBarItem.image = image
    vc.tabBarItem.selectedImage = selectedImage
    vc.navigationItem.title = title
    
    
    //    if vc is KRArenaViewController {
    //
    //    }
    //    let nav = vc is KRArenaViewController ? KRNavigationController(rootViewController: vc) : KRArenaNavigationController(rootViewController: vc)
    
    var nav:UINavigationController{
      if vc is KRArenaViewController {
        return KRArenaNavigationController(rootViewController: vc)
      } else {
        return KRNavigationController(rootViewController: vc)
      }
    }
    
    //    nav.navigationItem.title = title
    
    self.addChildViewController(nav)
    
    
    
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func selectedButtonAtIndex(selectedIndex:Int){
    self.selectedIndex = selectedIndex
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
