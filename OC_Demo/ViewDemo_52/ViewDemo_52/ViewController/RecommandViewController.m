//
//  RecommandViewController.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "RecommandViewController.h"

@interface RecommandViewController ()

@end

@implementation RecommandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*6, self.view.bounds.size.height*2);
    
     
    //实现翻页的功能
    scrollView.pagingEnabled = YES;
    NSArray *colorArray = @[ [UIColor systemPurpleColor], [UIColor blueColor], [UIColor brownColor], [UIColor whiteColor], [UIColor darkGrayColor]];
    
    for(int i = 0; i < 5; i++){
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width*i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    [self.view addSubview:scrollView];

}



@end
