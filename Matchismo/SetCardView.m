//
//  SetCardView.m
//  Matchismo
//
//  Created by Gilad Koch on 13/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView


- (void)setNumberOfShapes:(NSUInteger)numberOfShapes
{
    _numberOfShapes = numberOfShapes;
    [self setNeedsDisplay];
}

- (void)setShape:(Shapes)shape
{
    _shape = shape;
    [self setNeedsDisplay];
}

- (void)setShading:(Shadings)shading
{
    _shading = shading;
    [self setNeedsDisplay];
}

- (void)setShapeColor:(ShapeColors)shapeColor
{
    _shapeColor = shapeColor;
    [self setNeedsDisplay];
}

static const NSInteger kroundedRectRadius = 20;
static const float kroundedRectWidth = 0.6;
static const float kroundedRectHeight = 0.2;

- (CGFloat) gapBeetweenShapes
{
    return self.bounds.size.height * 0.05;
}

- (CGFloat) cardCenterY
{
    return self.bounds.size.height / 2.0;
}

- (CGFloat) shapeWidth
{
    return self.bounds.size.width * kroundedRectWidth;
}

- (CGFloat) shapeHeight
{
    return self.bounds.size.height * kroundedRectHeight;
}

- (CGFloat) shapeOriginX
{
    return ((1 - kroundedRectWidth) * self.bounds.size.width) / 2;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (self.isChosen) {
        [[UIColor redColor] setFill];
        UIRectFill(self.bounds);
//        self.layer.backgroundColor = [UIColor redColor].CGColor;
    }
    UIBezierPath *shapes = [self drawShapes];
    [self colorShapes: shapes];
    [self fillShapes: shapes];
    [shapes stroke];
    

}

- (UIBezierPath *) drawShapes{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGRect imageRect;
    
    if (self.numberOfShapes == 1) {
        [path appendPath:[self drawShapeWithRectBounds:CGRectMake([self shapeOriginX] ,
                                                                  [self cardCenterY] - [self shapeHeight] / 2.0,
                                                                  [self shapeWidth],
                                                                  [self shapeHeight])]];
    } else if (self.numberOfShapes == 2) {
        [path appendPath:[self drawShapeWithRectBounds:CGRectMake([self shapeOriginX] ,
                                                                  [self cardCenterY] - [self shapeHeight] - [self gapBeetweenShapes] / 2,
                                                                  [self shapeWidth],
                                                                  [self shapeHeight])]];
        
        [path appendPath:[self drawShapeWithRectBounds:CGRectMake([self shapeOriginX],
                                                                  [self cardCenterY] + [self gapBeetweenShapes] / 2.0,
                                                                  [self shapeWidth],
                                                                  [self shapeHeight])]];
    } else if (self.numberOfShapes == 3) {
        [path appendPath:[self drawShapeWithRectBounds:CGRectMake([self shapeOriginX] ,
                                                                  [self cardCenterY] - [self shapeHeight] / 2.0,
                                                                  [self shapeWidth],
                                                                  [self shapeHeight])]];
        
        [path appendPath:[self drawShapeWithRectBounds:CGRectMake([self shapeOriginX] ,
                                                                  [self cardCenterY] - [self shapeHeight] * 1.5 - [self gapBeetweenShapes],
                                                                  [self shapeWidth],
                                                                  [self shapeHeight])]];
        
        [path appendPath:[self drawShapeWithRectBounds:CGRectMake([self shapeOriginX] ,
                                                                  [self cardCenterY] + [self shapeHeight] / 2.0 + [self gapBeetweenShapes],
                                                                  [self shapeWidth],
                                                                  [self shapeHeight])]];
        
    }
    
    return path;
}

- (UIBezierPath *) drawShapeWithRectBounds: (CGRect) rect
{
    UIBezierPath *path;
    
    switch (self.shape) {
        case oval:
            path = [self drawOvalShape: rect];
            break;
        case diamond:
            path = [self drawDiamondShape: rect];
            break;
        case squigle:
            path = [self drawSquigleShape: rect];
            break;
        default:
            break;
    }
    
    return path;
}


- (UIBezierPath *) drawOvalShape: (CGRect) rect
{
    return [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:kroundedRectRadius];
}

- (UIBezierPath *) drawDiamondShape: (CGRect) rect
{
    //    CGSize size = CGSizeMake([self shapeWidth], [self shapeHeight]);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(rect.size.width / 2, 0)];
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height/2)];
    [path addLineToPoint:CGPointMake(rect.size.width / 2, rect.size.height)];
    [path addLineToPoint:CGPointMake(0, rect.size.height / 2)];
    [path closePath];
    [path applyTransform:CGAffineTransformMakeTranslation(rect.origin.x , rect.origin.y)];
    return path;
}

#define SQUIGGLE_WIDTH 0.12
#define SQUIGGLE_HEIGHT 0.3
#define SQUIGGLE_FACTOR 0.8

- (UIBezierPath *) drawSquigleShape:(CGRect) rect {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(104, 15)];
    [path addCurveToPoint:CGPointMake(63, 54) controlPoint1:CGPointMake(112.4, 36.9) controlPoint2:CGPointMake(89.7, 60.8)];
    [path addCurveToPoint:CGPointMake(27, 53) controlPoint1:CGPointMake(52.3, 51.3) controlPoint2:CGPointMake(42.2, 42)];
    [path addCurveToPoint:CGPointMake(5, 40) controlPoint1:CGPointMake(9.6, 65.6) controlPoint2:CGPointMake(5.4, 58.3)];
    [path addCurveToPoint:CGPointMake(36, 12) controlPoint1:CGPointMake(4.6, 22) controlPoint2:CGPointMake(19.1, 9.7)];
    [path addCurveToPoint:CGPointMake(89, 14) controlPoint1:CGPointMake(59.2, 15.2) controlPoint2:CGPointMake(61.9, 31.5)];
    [path addCurveToPoint:CGPointMake(104, 15) controlPoint1:CGPointMake(95.3, 10) controlPoint2:CGPointMake(100.9, 6.9)];
    
    [path applyTransform:CGAffineTransformMakeScale(0.9524 * rect.size.width / 100, 0.9524 * rect.size.height / 50)];
    [path applyTransform:CGAffineTransformMakeTranslation(rect.origin.x, rect.origin.y)];
    
    return path;
}


- (void) colorShapes: (UIBezierPath *)shapes
{
    UIColor *color = [self shapeColorFromEnum];
    [color set];
}

- (void) fillShapes: (UIBezierPath *) shapes
{
    switch (self.shading) {
        case clear:
            break;
        case stripe:
            [self drawStripes:shapes];
            break;
        case solid:
            [shapes fill];
        default:
            break;
    }
}

- (void) drawStripes: (UIBezierPath *) shapes
{
    UIBezierPath *stripes = [[UIBezierPath alloc] init];
    
    for (int i = 0; i < self.bounds.size.width; i += 3) {
        [stripes moveToPoint:CGPointMake(self.bounds.origin.x  + i, self.bounds.origin.y)];
        [stripes addLineToPoint: CGPointMake(self.bounds.origin.x + i, self.bounds.origin.y + self.bounds.size.height)];
    }
    
    CGContextSaveGState(UIGraphicsGetCurrentContext());
    
    [shapes addClip];
    [stripes stroke];
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}

- (UIColor *) shapeColorFromEnum
{
    UIColor *color = nil;
    
    switch (self.shapeColor) {
        case blue:
            color = [UIColor blueColor];
            break;
        case green:
            color = [UIColor greenColor];
            break;
        case purple:
            color = [UIColor purpleColor];
            break;
    }
    
    return color;
}

@end
