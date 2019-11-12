//
//  SetCard.h
//  Matchismo
//
//  Created by Gilad Koch on 04/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "Deck.h"
#import "SetCardShape.h"
NS_ASSUME_NONNULL_BEGIN

@interface SetCard : Card



typedef enum  {triangle, circle, square, firstShape = triangle, lastShape = square} Shapes;
typedef enum  {green, purple, blue, firstShapeColor = green, lastShapeColor = blue} ShapeColors;
typedef enum  {clear, stripe, solid, firstShading = clear, lastShading = solid} Shading;

@property (nonatomic) int numberOfShapes;
@property (nonatomic) Shading shading;
@property (nonatomic) Shapes shape;
@property (nonatomic) ShapeColors color;


+ (NSString *) cardShadingStringFromAlpha: (Shading)alphaValue;
+ (NSString *) colorStringFromShapeColorEnum:(ShapeColors) shapeColor;
+ (float) alphaValueFromShadingEnum: (Shading) shading;
+ (NSString *)shpaeStringFromShapeEnum:(Shapes)shape;
+ (NSArray *)shapes;
+ (NSArray *)shapeColors;
+ (NSInteger)maxShapesNumber;
+ (NSArray *)shapeAlphaValues;

@end

NS_ASSUME_NONNULL_END
