//
//  QuartzFunView.h
//  QuartzFun
//
//  Created by Taegyu Ryu on 10/12/09.
//  Copyright 2009 Dreamers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface QuartzFunView : UIView {
	CGPoint		firstTouch;
	CGPoint		lastTouch;
	UIColor		*currentColor;
	ShapeType	shapeType;
	UIImage		*drawImage;
	BOOL			useRandomColor;
}

@property CGPoint firstTouch;
@property CGPoint lastTouch;
@property (nonatomic, retain) UIColor *currentColor;
@property ShapeType shapeType;
@property (nonatomic, retain) UIImage *drawImage;
@property BOOL useRandomColor;

@end

