//
//  AppDelegate.swift
//  loadingVIEW
//
//  Created by Jason on 16/6/27.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    let str = UIStoryboard(name: "Main", bundle: nil)
    let vc = str.instantiateInitialViewController()
    
    
    
    guard let window = self.window else {
      return false
    }
    
    window.rootViewController = vc
    window.makeKeyAndVisible()
    let welcome = NSBundle.mainBundle().loadNibNamed("loadingView", owner: nil, options: nil)[0] as! loadingView
    welcome.frame = window.bounds
//    views.frame = (self.window?.bounds)!
//    views.welcome.text = "欢迎欢迎"
//    views.avatar.hidden = true
//    views.welcome.hidden = true
    
    self.window?.addSubview(welcome)
    
  UIView.animateWithDuration(1, animations: {
  welcome.slogn.alpha = 0
    welcome.avatar.transform = CGAffineTransformMakeTranslation(0, 50);
    }) { (_) in
    }
    
    
    
    UIView.animateWithDuration(1, delay: 0.5, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
      welcome.avatar.alpha = 1
      welcome.avatar.transform = CGAffineTransformIdentity
      }, completion: { (_) in
    })
    UIView.animateWithDuration(1, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
      welcome.welcome.alpha = 1
      }, completion: { (_) in
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
          welcome.alpha = 0
          }, completion: { (_) in
            welcome.removeFromSuperview()
        })
    })

  
//    self.view.addSubview(views)
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

