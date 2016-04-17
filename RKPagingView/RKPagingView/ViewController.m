//
//  ViewController.m
//  RKPagingView
//
//  Created by Jason on 4/6/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

#import "ViewController.h"
#import "RKPagingView.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property(nonatomic,weak)UIImageView* imageView ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RKPagingView *pageView = [RKPagingView pageView];
//    RKPagingView *pageView = [[RKPagingView alloc] initWithFrame:CGRectZero];

    
    
   pageView.frame = CGRectMake(37, 50, 300, 200);
    pageView.imageName = @[@"img_00", @"img_01", @"img_02", @"img_03", @"img_04"];
    
    [self.view addSubview:pageView];
    
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minion"]] ;
    
   
    [self.scroll addSubview:imageView] ;
    self.imageView = imageView;
        self.scroll.contentSize = imageView.image.size ;
    
    
    
//     self.imageView.frame=CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height); 
    self.scroll.delegate = self ;
    
    self.scroll.maximumZoomScale = 2.0 ;
    self.scroll.minimumZoomScale = 0.2 ;
//    self.scrollView.
    
    
}



//UIScrollView
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
   NSLog(@"缩放ing-----%f", scrollView.zoomScale);
}


@end
