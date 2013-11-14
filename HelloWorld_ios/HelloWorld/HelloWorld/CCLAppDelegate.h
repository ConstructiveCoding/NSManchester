//
//  CCLAppDelegate.h
//  HelloWorld
//
//  Created by Aiden Montgomery on 25/09/2013.
//  Copyright (c) 2013 Constructive Coding Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCLViewController.h"
#import <PebbleKit/PebbleKit.h>

@interface CCLAppDelegate : UIResponder <UIApplicationDelegate, PBPebbleCentralDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PBWatch *connectedWatch;

@end
