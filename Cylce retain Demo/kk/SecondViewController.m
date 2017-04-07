//
//  SecondViewController.m
//  kk
//
//  Created by kyle on 2017/4/6.
//  Copyright © 2017年 kyle. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic,strong)NSObject *notifi;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)void(^kblock)(void);
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self timerss];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    // 计时器需要断掉
        [_timer invalidate];
    
}

// 有循环引用
-(void) mainNotification{
     __weak SecondViewController* weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:@"main" object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.z = 10.0;
    }];
}

// 通知 ，需要强引用，不然当发送通知消息的时候，对象不存在了，就会造成奔溃
-(void) notifications{
    NSNotificationCenter *center = [[NSNotificationCenter alloc] init];
    __weak SecondViewController* weakSelf = self;
   [ center addObserverForName:@"main" object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.z = 10.0;
    }];
}
// 没有循环引用 和UIView.animate类似
-(void) mainQueue {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.z = 12;
    }];
}
// 没有循环引用 和UIView.animate类似
- (void)dispatchGroup{
    dispatch_async(dispatch_get_main_queue(), ^{
          NSLog(@"--------%f",self.z);
        self.z = 12;
    }) ;
    
   
}

// 有循环引用 self.kblock
- (void)kblockExam{
    self.z = 12;
    void (^kyle)(void) = ^() {
        NSLog(@"--%f",self.z);
    };
    
    _kblock =kyle;
    
    self.z = 1111;
    _kblock();
}

-(void)timerss{
    //YES 和 NO
    // If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
    //    Stops the receiver from ever firing again and requests its removal from its run loop.
    //    This method is the only way to remove a timer from an NSRunLoop object. The NSRunLoop object removes its strong reference to the timer, either just before the invalidate method returns or at some later point.
    //    If it was configured with target and user info objects, the receiver removes its strong references to those objects as well.
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(doSomeThing) userInfo:nil repeats:YES];
}

-(void)doSomeThing{
    NSLog(@"--------");
}
- (void)dealloc
{
    // 移除通知
    NSLog(@"%@",self);
}

@end
