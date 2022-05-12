//
//  RecommandViewController.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController () <UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height*2);
    scrollView.delegate = self;
     
    //实现翻页的功能
    scrollView.pagingEnabled = YES;
    NSArray *colorArray = @[ [UIColor systemPurpleColor], [UIColor blueColor], [UIColor brownColor], [UIColor whiteColor], [UIColor darkGrayColor]];
    
    for(int i = 0; i < 5; i++){
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width*i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor = [UIColor blackColor];
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];      //设置了一个tap手势关联的操作
                
                tapGesture.delegate = self;
                
                
                [view addGestureRecognizer:tapGesture];     //将手势操作注册到view上
                view;
            })];
            view;
        })];
    }
    [self.view addSubview:scrollView];

}

- (void)viewClick{
    NSLog(@"view is clicked!");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    return NO;      //不响应手势
    return YES;     //响应手势
}


/*滚动*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll-----%@",@(scrollView.contentOffset.y));
}
//开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewWillBeginDragging");
}
//停止拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    NSLog(@"scrollViewDidEndDragging");

}
//开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}
//停止减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}
@end
