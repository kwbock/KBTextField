//
//  KBTextFieldCell.m
//  KBTextField Demo
//
//  Created by Kyle Bock on 11/5/12.
//  Copyright (c) 2012 Kyle Bock. All rights reserved.
//

#import "KBTextFieldCell.h"

@implementation KBTextFieldCell

- (id) init {
    self = [super init];
    if (self) {
        [self setDrawsBackground:NO];
    }
    
    return self;
}

- (void)awakeFromNib {
    [self setDrawsBackground:NO];
    
}

- (void)drawWithFrame:(NSRect)frame inView:(NSView *)controlView {
    [NSGraphicsContext saveGraphicsState];
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:frame xRadius:7.0f yRadius:7.0f];

    [[NSColor grayColor] setFill];
    [path fill];
    
    [[NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 1.0f, 1.0f) xRadius:6.0f yRadius:6.0f] addClip];
    [[NSColor whiteColor] setFill];
    NSRectFillUsingOperation(frame, NSCompositeSourceOver);
    [NSGraphicsContext restoreGraphicsState];
    
    [self drawInteriorWithFrame:frame inView:controlView];
}


- (void)selectWithFrame:(NSRect)aRect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)anObject start:(NSInteger)selStart length:(NSInteger)selLength
{
	aRect = [self titleRectForBounds:aRect];
	[super selectWithFrame:aRect inView:controlView editor:textObj delegate:anObject start:selStart length:selLength];
}

- (void)editWithFrame:(NSRect)aRect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)anObject event:(NSEvent *)theEvent
{
	aRect = [self titleRectForBounds:aRect];
	[super editWithFrame:aRect inView:controlView editor:textObj delegate:anObject event:theEvent];
}

@end
