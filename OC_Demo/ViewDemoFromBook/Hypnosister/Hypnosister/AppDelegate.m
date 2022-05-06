//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Goggles on 2022/5/6.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *viewController = [[UIViewController alloc] init];
    self.window.rootViewController = viewController;

    CGRect firstFrame = CGRectMake(150, 200, 180, 180);     //frame = origin(150,200) size(180,180)
    HypnosisView *firstView = [[HypnosisView alloc] initWithFrame:self.window.bounds];
//    firstView.bounds = CGRectMake(-50,-50 ,180, 180);
//    firstView.backgroundColor = [UIColor blueColor];

//    HypnosisView *secondView = [[HypnosisView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
//    secondView.backgroundColor = [UIColor redColor];
//    [firstView addSubview:secondView];
    
    

    [self.window makeKeyAndVisible];
    [self.window addSubview:firstView];

    return YES;
}





@end
