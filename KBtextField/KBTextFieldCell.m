//
//  KBTextFieldCell.m
//  KBTextField Demo
//
//  Created by Kyle Bock on 11/5/12.
//  Copyright (c) 2012 Kyle Bock. All rights reserved.
//

#import "KBTextFieldCell.h"

@implementation KBTextFieldCell

- (void)awakeFromNib {
    [self setDrawsBackground:NO];
    
    // dirty and you aren't supposed to do this
    // using this until we find a better solution
     _cFlags.vCentered = 1;
}

- (id) init {
    self = [super init];
    if (self) {
        [self setDrawsBackground:NO];
    }
    
    return self;
}

#pragma mark - Editing Methods
//- (NSRect)titleRectForBounds:(NSRect)theRect {
//    NSRect titleFrame = [super titleRectForBounds:theRect];
//    NSSize titleSize = [[self attributedStringValue] size];
//    titleFrame.origin.y = theRect.origin.y + (theRect.size.height - titleSize.height) / 2.0;
//    return titleFrame;
//}
//
//- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
//    NSRect titleRect = [self titleRectForBounds:cellFrame];
//    [[self attributedStringValue] drawInRect:titleRect];
//}
//- (NSRect)titleRectForBounds:(NSRect)theRect {
//    NSRect titleFrame = [super titleRectForBounds:theRect];
//    NSSize titleSize = [[self attributedStringValue] size];
//    
//    // modified:
//    theRect.origin.y += (theRect.size.height - titleSize.height)/2.0 - 2;
//    return theRect;
//}
//

- (void)selectWithFrame:(NSRect)aRect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)anObject start:(NSInteger)selStart length:(NSInteger)selLength
{
	//aRect = [self titleRectForBounds:aRect];
	[super selectWithFrame:aRect inView:controlView editor:textObj delegate:anObject start:selStart length:selLength];
}

- (void)editWithFrame:(NSRect)aRect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)anObject event:(NSEvent *)theEvent
{
	//aRect = [self titleRectForBounds:aRect];
	[super editWithFrame:aRect inView:controlView editor:textObj delegate:anObject event:theEvent];
}

#pragma mark - Drawing Methods

- (void)drawWithFrame:(NSRect)frame inView:(NSView *)controlView {
    CGFloat borderRadius = 4.0f;
    
    [NSGraphicsContext saveGraphicsState];
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:frame xRadius:borderRadius yRadius:borderRadius];
    
    [[NSColor grayColor] setFill];
    [path fill];
    
    [[NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 1.0f, 1.0f) xRadius:borderRadius - 1 yRadius:borderRadius - 1] addClip];
    [[NSColor whiteColor] setFill];
    NSRectFillUsingOperation(frame, NSCompositeSourceOver);
    [NSGraphicsContext restoreGraphicsState];
    
    [self drawInteriorWithFrame:frame inView:controlView];
}

// changes focus ring radius to match that of the text cell
- (void)drawFocusRingMaskWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    [NSGraphicsContext saveGraphicsState];
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:cellFrame xRadius:4.0f yRadius:4.0f];
    [path addClip];
    [path fill];
    [NSGraphicsContext restoreGraphicsState];
    [super drawFocusRingMaskWithFrame:cellFrame inView:controlView];
}


@end
