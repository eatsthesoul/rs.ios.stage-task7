//
//  AppDelegate.m
//  Task7
//
//  Created by Evgeniy Petlitskiy on 3.07.21.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [ViewController new];
    self.window = window;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
