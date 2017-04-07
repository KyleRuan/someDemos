

## Demo目的
本程序只是针对之前的一次面试过程中，对部分循环引用的不熟悉，而做的demo，对此来加深一下循环引用的概念

1.  NSNotificationCenter

``` oc
// 有循环引用
-(void) mainNotification{
     __weak SecondViewController* weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:@"main" object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.z = 10.0;
    }];
}
```

2, NSOperationQueue

```
-(void) mainQueue {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.z = 12;
    }];
}
```
3,  dispatch_async
```
// 没有循环引用 和UIView.animate类似
- (void)dispatchGroup{
    dispatch_async(dispatch_get_main_queue(), ^{
          NSLog(@"--------%f",self.z);
        self.z = 12;
    }) ;
}
```
```
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
```

4 .timerss

定时器这个，比较特殊。对于
`scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(doSomeThing) userInfo:nil repeats:NO]` 这个方法不需要timer去手动加入到runloop，也不需要手动去调用fire方法，并且当 repeats设置为NO的时候，默认timer会在执行完毕，调用timer的invalidate方法，repeats设置为YES的时候,会强引用self，需要在特定的时候调用invalidate。

```
-(void)timerss{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(doSomeThing) userInfo:nil repeats:NO];
}
```
