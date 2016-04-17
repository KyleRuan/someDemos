//
//  RKPagingView.m
//  RKPagingView
//
//  Created by Jason on 4/6/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

#import "RKPagingView.h"


@interface RKPagingView()
@property (weak, nonatomic) IBOutlet UIScrollView *pageView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
/** 定时器 */
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation RKPagingView


#pragma mark- init

/**
 *  代码创建过程
 *
 *  @return 返回实例变量
 */
+(instancetype)pageView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject] ;
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         // 添加子控件代码
        
        [self setup] ;
    }
    return self;
}

//// 基本不需要写 ，这块是加载xib的文件coder是解析
//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super initWithCoder:coder];
//    if (self) {
//      
//    }
//    return self;
//}

/**
 *  设置模型
 *
 *  @param imageName 模型数据
 */

#pragma mark-  设置属性方法
-(void)setImageName:(NSArray *)imageName{
    for (int i = 0;i<imageName.count; i++) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: imageName[i] ] ] ;
         [self.pageView addSubview:imageView];
        
    }
}

#pragma mark- 初始化子控件
/**
 *  子控件的排列
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w =  self.pageView.frame.size.width ;
    CGFloat h = self.pageView.frame.size.height ;
    self.pageView.contentSize =  CGSizeMake(w, 0);
    for (int i = 0 ; i< self.pageView.subviews.count; i++) {
        UIImageView* imageView = self.pageView.subviews[i] ;
        imageView.frame = CGRectMake(i*w, 0, w, h);
    }
    self.pageView.contentSize = CGSizeMake(w* self.pageView.subviews.count, h) ;
    self.pageControl.numberOfPages = self.pageView.subviews.count;
    
}

/**
 *  从xib和storyboard中需要初始化
 */


-(void)awakeFromNib{
    [self setup] ;
}


-(void)setup{
    self.pageView.pagingEnabled = YES ;
    self.pageView.showsHorizontalScrollIndicator = NO ;
    self.pageView.showsVerticalScrollIndicator = NO ;
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES] ;
}



#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
   self.pageControl.currentPage = (int)(self.pageView.contentOffset.x /self.pageView.frame.size.width +0.5) ;
//    NSLog(@"scrollView --------") ;
}




-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate] ;
    self.timer = nil;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

    
}

-(void)nextPage{
    NSInteger page = self.pageControl.currentPage+1;
    if (page == self.pageControl.numberOfPages) {
        page = 0 ;
    }
    NSLog(@"page:%ld",(long)page);
    CGFloat w = self.pageView.frame.size.width ;
    CGFloat offsetX = page*w ;
    [self.pageView setContentOffset: CGPointMake(offsetX, 0)  animated:YES];
    
}

@end
