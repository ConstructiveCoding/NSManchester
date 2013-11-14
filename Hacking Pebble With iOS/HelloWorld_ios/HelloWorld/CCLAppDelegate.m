//
//  CCLAppDelegate.m
//  HelloWorld
//
//  Created by Aiden Montgomery on 25/09/2013.
//  Copyright (c) 2013 Constructive Coding Ltd. All rights reserved.
//

#import "CCLAppDelegate.h"

@implementation CCLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
  // We'd like to get called when Pebbles connect and disconnect, so become the delegate of PBPebbleCentral:
  [[PBPebbleCentral defaultCentral] setDelegate:self];
  
  // Initialize with the last connected watch:
  [self setConnectedWatch:[[PBPebbleCentral defaultCentral] lastConnectedWatch]];
  CCLViewController *vc = (CCLViewController*)self.window.rootViewController;
  vc.pebble = _connectedWatch;
  return YES;
}

- (void)setConnectedWatch:(PBWatch *)connectedWatch{
  _connectedWatch = connectedWatch;
}

- (void)pebbleCentral:(PBPebbleCentral *)central watchDidConnect:(PBWatch *)watch isNew:(BOOL)isNew{
  [self setConnectedWatch:watch];
  CCLViewController *vc = (CCLViewController*)self.window.rootViewController;
  vc.pebble = _connectedWatch;
}

- (void)pebbleCentral:(PBPebbleCentral *)central watchDidDisconnect:(PBWatch *)watch{
  [self setConnectedWatch:nil];
  CCLViewController *vc = (CCLViewController*)self.window.rootViewController;
  vc.pebble = _connectedWatch;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
