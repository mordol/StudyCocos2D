//
//  Cocos2dAppDelegate.m
//  Cocos2d
//
//  Created by Taegyu Ryu on 10/26/09.
//  Copyright Dreamers 2009. All rights reserved.
//

#import "Cocos2dAppDelegate.h"
#import "cocos2d.h"

@implementation Cocos2dAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	// Create UIWindow object
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Regist View to director
	[[Director sharedDirector] attachInView:window];
	
	// Create HelloScene
	Scene *helloScene = [Scene node];
	Label *helloLabel = [Label labelWithString:@"Hello World of Cocos2d." fontName:@"Helvetica" fontSize:20.0f];
	helloLabel.position = ccp(150, 200);
	[helloScene addChild:helloLabel];
	
	// Execute HelloScene
	[[Director sharedDirector] runWithScene:helloScene];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
