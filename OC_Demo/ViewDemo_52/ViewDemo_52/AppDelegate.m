//
//  AppDelegate.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "AppDelegate.h"
#import "ViewController/ViewController2.h"
#import "ViewController/ViewController.h"
#import "ViewController/VideoController.h"
#import "ViewController/RecommandViewController.h"

//#import "TESTUIView.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController = [[ViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //创建TabBarController
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
   
    //设置window的rootcontroller为tabbarcontroller
//    self.window.rootViewController = tabbarController;
    
    //创建四个tabbarcontroller控制的viewcontroller
    ViewController *controller1 = [[ViewController alloc] init];
    controller1.view.backgroundColor = [UIColor whiteColor];
    controller1.tabBarItem.title = @"微信";

    
    /*
     将通讯录页面换成navigationcontroller,并将自定义的viewcontroller作为rootview
     */
    ViewController2 *controller2 = [[ViewController2 alloc] init];
    controller2.tabBarItem.title = @"通讯录";

//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc]init]];
//    navigationController.view.backgroundColor = [UIColor yellowColor];
//    navigationController.tabBarItem.title = @"通讯录";
   

    
    VideoController *controller3 = [[VideoController alloc] init];
//    controller3.view.backgroundColor = [UIColor blueColor];
    controller3.tabBarItem.title = @"发现";
    
    RecommandViewController *controller4 = [[RecommandViewController alloc] init];
    controller4.tabBarItem.title = @"推荐";
    
    UIViewController *controller5 = [[UIViewController alloc] init];
//    controller4.view.backgroundColor = [UIColor greenColor];
    controller5.tabBarItem.title = @"我的";

    
    //将上面的四个viewcontroller加入到tabbarcontroller里
    [tabbarController setViewControllers:@[controller1,controller2,controller3,controller4,controller5]];
    
    tabbarController.delegate = self;
    //创建一个NavigationController
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    self.window.rootViewController = navigationController;  //修改为navigatuoncontroller
    [self.window makeKeyAndVisible];
    return YES;
}

//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//
//}
/*
 每次点击tabbaritem实现viewcontroller切换的时候都会执行的操作
 */
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"dhsgdbhs");
}
@end
