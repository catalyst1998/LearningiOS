//
//  AppDelegate.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "AppDelegate.h"
#import "ViewController.h"
//#import "TESTUIView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[ViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
//    CGRect firstFrame = CGRectMake(160, 200, 200, 300);
//    TESTUIView *firstView = [[TESTUIView alloc] initWithFrame:firstFrame];
//    firstView.backgroundColor = [UIColor redColor];
//    [self.window addSubview:firstView];
//    self.window.backgroundColor = [UIColor whiteColor];
    return YES;
}


//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//
//}

@end
