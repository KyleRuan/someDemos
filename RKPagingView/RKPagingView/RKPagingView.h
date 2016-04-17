//
//  RKPagingView.h
//  RKPagingView
//
//  Created by Jason on 4/6/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKPagingView : UIView<UIScrollViewDelegate>



+(instancetype)pageView;

@property(nonatomic,retain)NSArray* imageName;



@end
