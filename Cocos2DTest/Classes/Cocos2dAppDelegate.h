//
//  Cocos2dAppDelegate.h
//  Cocos2d
//
//  Created by Taegyu Ryu on 10/26/09.
//  Copyright Dreamers 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cocos2dAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

