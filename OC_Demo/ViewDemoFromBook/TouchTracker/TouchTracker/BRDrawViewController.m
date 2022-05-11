//
//  BRDrawViewController.m
//  TouchTracker
//
//  Created by Goggles on 2022/5/10.
//

#import "BRDrawViewController.h"
#import "BRDrawView.h"

@interface BRDrawViewController ()

@end

@implementation BRDrawViewController
- (void)loadView{
    self.view = [[BRDrawView alloc] init];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
    label.text = @"双击清屏";
    label.textColor = [UIColor grayColor];
    
    
    [self.view addSubview:label];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
