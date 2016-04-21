//
//  RKPickerViewCell.h
//  PickViewDemo
//
//  Created by Jason on 16/4/21.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RKFlag;

@interface RKPickerViewCell : UIView

@property(nonatomic,strong) RKFlag* flag ;

+(instancetype)pickViewCell;

@end
