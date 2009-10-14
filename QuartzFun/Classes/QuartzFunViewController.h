//
//  QuartzFunViewController.h
//  QuartzFun
//
//  Created by Taegyu Ryu on 10/12/09.
//  Copyright Dreamers 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzFunViewController : UIViewController {
	IBOutlet	UISegmentedControl *colorControl;
}
@property (nonatomic, retain) UISegmentedControl *colorControl;
- (IBAction)changeColor:(id)sender;
- (IBAction)changeShape:(id)sender;
@end

