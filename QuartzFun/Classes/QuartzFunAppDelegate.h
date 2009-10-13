//
//  QuartzFunAppDelegate.h
//  QuartzFun
//
//  Created by Taegyu Ryu on 10/12/09.
//  Copyright Dreamers 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuartzFunViewController;

@interface QuartzFunAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    QuartzFunViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet QuartzFunViewController *viewController;

@end

