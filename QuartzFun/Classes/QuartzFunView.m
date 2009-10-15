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
@synthesize redrawRect;
@dynamic currentRect;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		self.currentColor = [UIColor redColor];
		self.useRandomColor = NO;
    }
    return self;
}

- (CGRect)currentRect {
	return CGRectMake (
			(firstTouch.x > lastTouch.x) ? lastTouch.x : firstTouch.x,
			(firstTouch.y > lastTouch.y) ? lastTouch.y : firstTouch.y,
			fabsf(firstTouch.x - lastTouch.x),
			fabsf(firstTouch.y - lastTouch.y));	
}

- (void)drawRect:(CGRect)rect {
	
	if (currentColor == nil)
		self.currentColor = [UIColor redColor];
	
    CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(context, 2.0);
	CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
	
	CGContextSetFillColorWithColor(context, currentColor.CGColor);
	
	switch (shapeType) {
		case kLineShape:
			CGContextMoveToPoint(context, firstTouch.x, firstTouch.y);
			CGContextAddLineToPoint(context, lastTouch.x, lastTouch.y);
			CGContextStrokePath(context);
			break;
		
		case kRectShape:
			CGContextAddRect(context, self.currentRect);
			CGContextDrawPath(context, kCGPathFillStroke);
			break;
		
		case kEllipseShape:
			CGContextAddEllipseInRect(context, self.currentRect);
			CGContextDrawPath(context, kCGPathFillStroke);
			break;
			
		case kImageShape:
		{
			if (drawImage == nil)
			{
				self.drawImage = [UIImage imageNamed:@"iphone.png"];
				horizontalOffset = drawImage.size.width / 2;
				verticalOffset =  drawImage.size.height / 2;
			}

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
	if (useRandomColor && shapeType != kImageShape)
		self.currentColor = [UIColor randomColor];
	
	UITouch *touch = [touches anyObject];
	firstTouch = [touch locationInView:self];
	lastTouch = [touch locationInView:self];
	
	if (shapeType == kImageShape)
		redrawRect = CGRectMake(firstTouch.x - horizontalOffset, firstTouch.y - verticalOffset,
										drawImage.size.width, drawImage.size.height);
	else
		redrawRect = CGRectMake(firstTouch.x, firstTouch.y, 0, 0);
	
	[self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	lastTouch = [touch locationInView:self];
	
	if (shapeType == kImageShape)
		redrawRect = CGRectUnion(redrawRect, CGRectMake(
							firstTouch.x - horizontalOffset, firstTouch.y - verticalOffset,
							drawImage.size.width, drawImage.size.height));
	else
		redrawRect = CGRectUnion(redrawRect, self.currentRect);
	
	redrawRect = CGRectInset(redrawRect, -2.0, -2.0);
	[self setNeedsDisplayInRect:redrawRect];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	lastTouch = [touch locationInView:self];

	if (shapeType == kImageShape)
		redrawRect = CGRectUnion(redrawRect, CGRectMake(
							firstTouch.x - horizontalOffset, firstTouch.y - verticalOffset,
							drawImage.size.width, drawImage.size.height));
	else
		redrawRect = CGRectUnion(redrawRect, self.currentRect);
	
	redrawRect = CGRectInset(redrawRect, -2.0, -2.0);
	[self setNeedsDisplayInRect:redrawRect];
}

- (void)dealloc {
	[currentColor release];
	[drawImage release];
    [super dealloc];
}

@end
