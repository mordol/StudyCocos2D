//
//  QuartzFunAppDelegate.m
//  QuartzFun
//
//  Created by Taegyu Ryu on 10/12/09.
//  Copyright Dreamers 2009. All rights reserved.
//

#import "QuartzFunAppDelegate.h"
#import "QuartzFunViewController.h"

@implementation QuartzFunAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
