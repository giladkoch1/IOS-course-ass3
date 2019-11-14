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

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    UIBezierPath *path = [self ovalShpes];
    [path stroke];
    //    switch (self.shape) {
    //        case oval:
    //            shapes =
    //            break;
    //
    //        default:
    //            break;
    //    }
    //
    //    [self drwaOvalShpes];
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




- (UIBezierPath *)ovalShpes{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGRect imageRect;
    
    if (self.numberOfShapes == 1) {
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake([self shapeOriginX] ,
                                                                            [self cardCenterY] - [self shapeHeight] / 2.0,
                                                                            [self shapeWidth],
                                                                            [self shapeHeight]) cornerRadius:kroundedRectRadius]];
    } else if (self.numberOfShapes == 2) {
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake([self shapeOriginX] ,
                                                                            [self cardCenterY] - [self shapeHeight] - [self gapBeetweenShapes] / 2,
                                                                            [self shapeWidth],
                                                                            [self shapeHeight]) cornerRadius:kroundedRectRadius]];
        
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake([self shapeOriginX],
                                                                            [self cardCenterY] + [self gapBeetweenShapes] / 2.0,
                                                                            [self shapeWidth],
                                                                            [self shapeHeight]) cornerRadius:kroundedRectRadius]];
    } else if (self.numberOfShapes == 3) {
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake([self shapeOriginX] ,
                                                                            [self cardCenterY] - [self shapeHeight] / 2.0,
                                                                            [self shapeWidth],
                                                                            [self shapeHeight]) cornerRadius:kroundedRectRadius]];
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake([self shapeOriginX] ,
                                                                            [self cardCenterY] - [self shapeHeight] * 1.5 - [self gapBeetweenShapes],
                                                                            [self shapeWidth],
                                                                            [self shapeHeight]) cornerRadius:kroundedRectRadius]];
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake([self shapeOriginX] ,
                                                                            [self cardCenterY] + [self shapeHeight] / 2.0 + [self gapBeetweenShapes],
                                                                            [self shapeWidth],
                                                                            [self shapeHeight]) cornerRadius:kroundedRectRadius]];
    }
    
    return path;
}

- (UIBezierPath *) diamondShapes
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGRect imageRect;
    
    if (self.numberOfShapes == 1) {
        [path appendPath:[self diamonsShapeWithCentralPoint:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height /2)]];
        [path stroke];
    } else if (self.numberOfShapes == 2) {
        imageRect = CGRectInset(self.bounds,
                                self.bounds.size.width * kroundedRectWidth,
                                self.bounds.size.height * kroundedRectHeight);
        imageRect.origin.y = imageRect.origin.y - (imageRect.size.height / 2) - [self gapBeetweenShapes] / 2;
        
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:kroundedRectRadius]];
        
        imageRect = CGRectInset(self.bounds,
                                self.bounds.size.width * kroundedRectWidth,
                                self.bounds.size.height * kroundedRectHeight);
        imageRect.origin.y = imageRect.origin.y + (imageRect.size.height / 2) + [self gapBeetweenShapes] / 2;
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:kroundedRectRadius]];
    } else if (self.numberOfShapes == 3) {
        imageRect = CGRectInset(self.bounds,
                                self.bounds.size.width * kroundedRectWidth,
                                self.bounds.size.height * kroundedRectHeight);
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:kroundedRectRadius]];
        
        imageRect = CGRectInset(self.bounds,
                                self.bounds.size.width * kroundedRectWidth,
                                self.bounds.size.height * kroundedRectHeight);
        imageRect.origin.y = imageRect.origin.y + imageRect.size.height + [self gapBeetweenShapes];
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:kroundedRectRadius]];
        
        imageRect = CGRectInset(self.bounds,
                                self.bounds.size.width * kroundedRectWidth,
                                self.bounds.size.height * kroundedRectHeight);
        imageRect.origin.y = imageRect.origin.y - imageRect.size.height - [self gapBeetweenShapes];
        [path appendPath:[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:kroundedRectRadius]];
    }
    
    return path;
}

- (UIBezierPath *) diamonsShapeWithCentralPoint: (CGPoint) point
{
    CGSize size = CGSizeMake([self shapeWidth], [self shapeHeight]);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(size.width / 2, 0)];
    [path addLineToPoint:CGPointMake(size.width, size.height/2)];
    [path addLineToPoint:CGPointMake(size.width / 2, size.height)];
    [path addLineToPoint:CGPointMake(0, size.height / 2)];
    [path closePath];
    [path applyTransform:CGAffineTransformMakeTranslation(point.x - size.width/2 , point.y - size.height/2 )];
    return path;
}

//- (void) diamondShapes
//{
//    NSMutableArray *shapes = [[NSMutableArray alloc] init];
//
//    CGSize shapeSize = CGSizeMake(self.bounds.size.width * kroundedRectWidth,
//                                  self.bounds.size.height * kroundedRectHeight);
//
//
//
//}

#define SQUIGGLE_WIDTH 0.12
#define SQUIGGLE_HEIGHT 0.3
#define SQUIGGLE_FACTOR 0.8

- (void)drawSquiggleAtPoint:(CGPoint)point {
    CGFloat dx = self.bounds.size.width * SQUIGGLE_WIDTH / 2.0;
    CGFloat dy = self.bounds.size.height * SQUIGGLE_HEIGHT / 2.0;
    CGFloat dsqx = dx * SQUIGGLE_FACTOR;
    CGFloat dsqy = dy * SQUIGGLE_FACTOR;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(point.x - dx, point.y - dy)];
    [path addQuadCurveToPoint:CGPointMake(point.x + dx, point.y - dy)
                 controlPoint:CGPointMake(point.x - dsqx, point.y - dy - dsqy)];
    [path addCurveToPoint:CGPointMake(point.x + dx, point.y + dy)
            controlPoint1:CGPointMake(point.x + dx + dsqx, point.y - dy + dsqy)
            controlPoint2:CGPointMake(point.x + dx - dsqx, point.y + dy - dsqy)];
    [path addQuadCurveToPoint:CGPointMake(point.x - dx, point.y + dy)
                 controlPoint:CGPointMake(point.x + dsqx, point.y + dy + dsqy)];
    [path addCurveToPoint:CGPointMake(point.x - dx, point.y - dy)
            controlPoint1:CGPointMake(point.x - dx - dsqx, point.y + dy - dsqy)
            controlPoint2:CGPointMake(point.x - dx + dsqx, point.y - dy + dsqy)];
    //    path.lineWidth = self.bounds.size.width * SYMBOL_LINE_WIDTH;
    //    [self shadePath:path];
    [path stroke];
}


- (UIColor *) cardColorFromEnum
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

+ (NSString *) colorStringFromShapeColorEnum:(ShapeColors) shapeColor
{
    NSString *colorString = nil;
    
    switch (shapeColor) {
        case blue:
            colorString = @"blue";
            break;
        case green:
            colorString = @"green";
            break;
        case purple:
            colorString = @"purple";
            break;
    }
    
    return colorString;
}

+ (float) alphaValueFromShadingEnum: (Shadings) shading
{
    float alpha;
    
    switch (shading) {
        case clear:
            alpha = 0.0;
            break;
        case stripe:
            alpha = 0.5;
            break;
        case solid:
            alpha = 1.0;
            break;
    }
    
    return alpha;
}

+ (NSString *)shpaeStringFromShapeEnum:(Shapes)shape
{
    NSString *shapeString;
    
    switch (shape) {
        case squigle:
            shapeString = @"●";
            break;
        case diamond:
            shapeString = @"■";
            break;
        case oval:
            shapeString = @"▲";
            break;
    }
    
    return shapeString;
}


@end
