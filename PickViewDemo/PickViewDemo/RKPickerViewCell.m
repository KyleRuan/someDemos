//
//  RKPickerViewCell.m
//  PickViewDemo
//
//  Created by Jason on 16/4/21.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

#import "RKPickerViewCell.h"
#import "RKFlag.h"

@interface RKPickerViewCell()
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UIImageView *icon;


@end

@implementation RKPickerViewCell

+(instancetype)pickViewCell{
//    RKPickerViewCell* cell = [[RKPickerViewCell alloc] init] ;
    
    RKPickerViewCell* cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
    
    return cell ;
}


-(void)setFlag:(RKFlag *)flag{
    _country.text = flag.name ;
    _icon.image = flag.icon ;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
