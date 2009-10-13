//
//  QuartzFunView.m
//  QuartzFun
//
//  Created by Taegyu Ryu on 10/12/09.
//  Copyright 2009 Dreamers. All rights reserved.
//

#import "QuartzFunView.h"
#import "UIColor-Random.h"

@implementation QuartzFunView
@synthesize firstTouch;
@synthesize lastTouch;
@synthesize currentColor;
@synthesize shapeType;
@synthesize drawImage;
@synthesize useRandomColor;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.currentColor = [UIColor redColor];
		self.useRandomColor = NO;
		if (drawImage == nil) {
			self.drawImage = [UIImage imageNamed:@"iphone.png"];
		}
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (useRandomColor)
		self.currentColor = [UIColor randomColor];
	
	UITouch *touch = [touches anyObject];
	firstTouch = [touch locationInView:self];
	lastTouch = [touch locationInView:self];
	[self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	lastTouch = [touch locationInView:self];
	[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	lastTouch = [touch locationInView:self];
	[self setNeedsDisplay];
}

- (void)dealloc {
	[currentColor release];
	[drawImage release];
    [super dealloc];
}


@end
