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
	
	if (currentColor == nil)
		self.currentColor = [UIColor redColor];
	
    CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(context, 2.0);
	CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
	
	CGContextSetFillColorWithColor(context, currentColor.CGColor);
	CGRect currentRect = CGRectMake(
			(firstTouch.x > lastTouch.x) ? lastTouch.x : firstTouch.x,
			(firstTouch.y > lastTouch.y) ? lastTouch.y : firstTouch.y,
			fabsf(firstTouch.x - lastTouch.x),
									fabsf(firstTouch.y - lastTouch.y));
	
	switch (shapeType) {
		case kLineShape:
			CGContextMoveToPoint(context, firstTouch.x, firstTouch.y);
			CGContextAddLineToPoint(context, lastTouch.x, lastTouch.x);
			CGContextStrokePath(context);
			break;
		
		case kRectShape:
			CGContextAddRect(context, currentRect);
			CGContextDrawPath(context, kCGPathFillStroke);
			break;
		
		case kEllipseShape:
			CGContextAddEllipseInRect(context, currentRect);
			CGContextDrawPath(context, kCGPathFillStroke);
			break;
			
		case kImageShape:
		{
			CGFloat horizontalOffset = drawImage.size.width / 2;
			CGFloat verticalOffset =  drawImage.size.height / 2;
			CGPoint drawPoint = CGPointMake(lastTouch.x - horizontalOffset,
											lastTouch.y - verticalOffset);
			[drawImage drawAtPoint:drawPoint];
			break;
		}

		default:
			break;
	}
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
