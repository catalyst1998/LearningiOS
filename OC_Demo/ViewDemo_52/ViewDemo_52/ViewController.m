//
//  ViewController.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "ViewController.h"
@interface TestView :UIView

@end

@implementation TestView
- (instancetype)init{
    if(self = [super init]){
        
    }
    return self;
}
- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init{
    if(self = [super init]){
        
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TestView *view = [[TestView alloc]init];
    view.backgroundColor = [UIColor blueColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor blackColor];
    view2.frame = CGRectMake(170, 170, 100, 100);
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"hello,world";
    label.frame = CGRectMake(10, 10,100,100);
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    [self.view addSubview:view];
    [self.view addSubview:view2];

}


@end


