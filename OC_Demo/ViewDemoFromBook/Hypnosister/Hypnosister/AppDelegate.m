//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Goggles on 2022/5/6.
//

#import "AppDelegate.h"
#import "HypnosisterViewController.h"
#import "ReminderViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];


    
    HypnosisterViewController *hvc = [[HypnosisterViewController alloc] init];
    
    /*
     1.加载NIB文件
     */
    //获取指向NSBundle对象的指针，该指针代表应用的主程序包。主程序包对应于文件系统中项目的根目录，包括代码和资源文件（NIB文件和图片）
//    NSBundle *appBundle = [NSBundle mainBundle];
    //初始化controller 通过Nib的名字和程序包
//    ReminderViewController *rvc = [[ReminderViewController alloc] initWithNibName:@"ReminderViewController" bundle:appBundle];
    //到这里NIB文件会被加载，会创建文件中的视图对象，但是如果此时运行会报错：“loaded the "ReminderViewController" nib but the view outlet was not set.”
    //这是因为这些视图对象在app运行时并没有喝RVC关联起来。此时RVC的view是nil
    
    /*
     2.将NIB文件和ViewController关联
     ...通过file owner
     */
    
    ReminderViewController *rvc = [[ReminderViewController alloc] init];
    
    
    //创建tabbarcontroller来管理多个视图控制器，通过点击item来切换视图控制器
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.viewControllers = @[hvc,rvc];
    self.window.rootViewController = tabbarController;
    
    



    return YES;
}


/*
 
 //    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.window.bounds];
 //    [scrollView setPagingEnabled:YES];
 //    [self.window addSubview:scrollView];
 //
 //
 //    CGRect firstFrame = self.window.bounds;
 //    CGRect bigFrame = firstFrame;
 //    //frame = origin(150,200) size(180,180)
 ////    firstFrame.size.width *=2;
 ////    firstFrame.size.height *=2;
 //
 //    //创建两个大小和屏幕相等的view，并排放
 //    HypnosisView *firstView = [[HypnosisView alloc] initWithFrame:firstFrame];
 //
 //    firstFrame.origin.x += firstFrame.size.width;
 //    HypnosisView *secondView = [[HypnosisView alloc] initWithFrame:firstFrame];
 //
 //    [scrollView addSubview:firstView];
 //    [scrollView addSubview:secondView];
 //
 //    bigFrame.size.width *=2;
 //    scrollView.contentSize = bigFrame.size;   //设置scrollview的展示内容的大小
     
     
 //    firstView.bounds = CGRectMake(-50,-50 ,180, 180);
 //    firstView.backgroundColor = [UIColor blueColor];
 */


@end
