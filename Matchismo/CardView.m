//
//  CardView.m
//  Matchismo
//
//  Created by Gilad Koch on 13/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "CardView.h"

@implementation CardView

#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat) cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT; }
- (CGFloat) cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat) cornerOffset { return [self cornerRadius] / 3.0; }

- (void) drawRect: (CGRect)rect {
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius: [self cornerRadius]];
    
    [roundedRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

#pragma mark - Initialization
- (void) setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setIsChosen:(BOOL)faceUp
{
    _isChosen = faceUp;
    [self setNeedsDisplay];
}


- (void)pushContextAndRotate
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}

- (void)popContext
{
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}

@end
