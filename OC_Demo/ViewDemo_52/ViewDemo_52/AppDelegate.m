//
//  AppDelegate.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "AppDelegate.h"
#import "GTContactViewController.h"
#import "GTChatViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"

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

	tabbarController.title = @"Telegram";

	//设置window的rootcontroller为tabbarcontroller
//    self.window.rootViewController = tabbarController;

	//创建四个tabbarcontroller控制的viewcontroller
	GTChatViewController *chatViewController = [[GTChatViewController alloc] init];
	chatViewController.view.backgroundColor = [UIColor whiteColor];
	chatViewController.tabBarItem.title = @"Chats";


	/*
	   将通讯录页面换成navigationcontroller,并将自定义的viewcontroller作为rootview
	 */
	GTContactViewController *contactViewController = [[GTContactViewController alloc] init];
	contactViewController.tabBarItem.title = @"Contacts";

//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc]init]];
//    navigationController.view.backgroundColor = [UIColor yellowColor];
//    navigationController.tabBarItem.title = @"通讯录";



	GTVideoViewController *videoViewController = [[GTVideoViewController alloc] init];
//    videoViewController.view.backgroundColor = [UIColor blueColor];
	videoViewController.tabBarItem.title = @"Discovery";

	GTRecommendViewController *recommandViewController = [[GTRecommendViewController alloc] init];
	recommandViewController.tabBarItem.title = @"Recommand";

	UIViewController *settingViewController = [[UIViewController alloc] init];
//    recommandViewController.view.backgroundColor = [UIColor greenColor];
	settingViewController.tabBarItem.title = @"Settings";


	//将上面的四个viewcontroller加入到tabbarcontroller里
	[tabbarController setViewControllers:@[chatViewController,contactViewController,videoViewController,recommandViewController,settingViewController]];

	tabbarController.delegate = self;
	//创建一个NavigationController
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];

	self.window.rootViewController = navigationController; //修改为navigatuoncontroller
	[self.window makeKeyAndVisible];
	return YES;
}

//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//
//}
/*
   每次点击tabbaritem实现viewcontroller切换的时候都会执行的操作
 */
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
	NSLog(@"dhsgdbhs");
}
@end
