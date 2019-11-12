//
//  SetCard.m
//  Matchismo
//
//  Created by Gilad Koch on 04/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "SetCard.h"

@interface SetCard()

+ (NSString *) cardShadingStringFromAlpha: (Shading)alphaValue;
+ (NSString *) colorStringFromShapeColorEnum:(ShapeColors) shapeColor;
+ (float) alphaValueFromShadingEnum: (Shading) shading;
+ (NSString *)shpaeStringFromShapeEnum:(Shapes)shape;

@end
@implementation SetCard


+ (NSInteger)maxShapesNumber
{
    return 3;
}

+ (NSString *) cardShadingStringFromAlpha: (Shading)alphaValue
{
    NSString *shading;
    
    switch (alphaValue) {
        case clear:
            shading = @"clear";
            break;
        case stripe:
            shading = @"stripe";
            break;
        case solid:
            shading = @"solid";
            break;
    }
    
    return shading;
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

+ (float) alphaValueFromShadingEnum: (Shading) shading
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
        case circle:
            shapeString = @"●";
            break;
        case square:
            shapeString = @"■";
            break;
        case triangle:
            shapeString = @"▲";
            break;
    }
    
    return shapeString;
}

- (NSString *)contents
{
    
    return [[NSString alloc] initWithFormat:@"%@ %@ %@ %@", [[NSNumber numberWithInt:self.numberOfShapes] stringValue], [SetCard shpaeStringFromShapeEnum:self.shape],
            [SetCard colorStringFromShapeColorEnum:self.color],
            [SetCard cardShadingStringFromAlpha:self.shading]];
}



@end
