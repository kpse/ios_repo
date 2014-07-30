//
//  AppDelegate.m
//  AboutCanada
//
//  Created by kpse on 7/30/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    MainViewController *viewController = [[MainViewController new] autorelease];
    UINavigationController *naviController = [[[UINavigationController alloc]
            initWithRootViewController:viewController] autorelease];
    self.window.rootViewController = naviController;
    return YES;
}

@end
