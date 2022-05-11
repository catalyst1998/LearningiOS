//
//  AppDelegate.m
//  Homepwner
//
//  Created by Goggles on 2022/5/9.
//

#import "AppDelegate.h"
#import "ItemTableViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor clearColor];
    [self.window makeKeyWindow];
    
    ItemTableViewController *itemTVC = [[ItemTableViewController alloc] init];
    
    self.window.rootViewController = itemTVC;
    
    
    
    
    return YES;
}




@end


