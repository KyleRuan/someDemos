//
//  ViewController.m
//  PickViewDemo
//
//  Created by Jason on 16/4/21.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

#import "ViewController.h"
#import "RKFlag.h"
#import "RKPickerViewCell.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIDatePicker *dayPicker;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property(nonatomic,strong) NSMutableArray* flags ;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation ViewController


-(NSMutableArray *)flags{
    
    if (_flags == nil) {
         _flags = [NSMutableArray array];
        NSString* path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil] ;
        
        NSArray* dicArray =  [NSArray arrayWithContentsOfFile:path] ;
        for (NSDictionary* dic in dicArray) {
            RKFlag * flag = [RKFlag flagWithDic:dic];
            [_flags addObject:flag] ;
        }
    }
    
    return  _flags ;
}





- (void)viewDidLoad {
    [super viewDidLoad];

    
    [_dayPicker addTarget:self action:@selector(pickBirthDay) forControlEvents:UIControlEventValueChanged] ;
    self.birthday.text = @"" ;
    self.pickView.delegate = self ;
    self.pickView.dataSource = self ;
    self.name.text = [self.flags[0] name] ;
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pickBirthDay{
//    self.birthday.text =  _dayPicker.date. ;
    
    NSDate * date  = _dayPicker.date ;
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init] ;
    formatter.dateFormat =  @"YYYY-MM-dd" ;
    self.birthday.text =   [formatter stringFromDate:date] ;
    
}


#pragma :--  UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  1 ;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count ;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    RKPickerViewCell * cell  =[RKPickerViewCell pickViewCell] ;
    cell.flag = self.flags[row] ;
    
    return cell;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}
//
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.name.text  =  [self.flags[row] name];
}



@end
