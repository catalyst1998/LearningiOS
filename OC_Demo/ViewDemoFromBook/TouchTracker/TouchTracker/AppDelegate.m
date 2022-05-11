//
//  AppDelegate.m
//  TouchTracker
//
//  Created by Goggles on 2022/5/10.
//

#import "AppDelegate.h"
#import "BRDrawViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor clearColor];
    [self.window makeKeyWindow];

    BRDrawViewController *dvc = [[BRDrawViewController alloc] init];
    self.window.rootViewController = dvc;
    
    return YES;
}



@end
