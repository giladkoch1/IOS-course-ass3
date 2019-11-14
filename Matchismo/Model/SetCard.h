//
//  SetCard.h
//  Matchismo
//
//  Created by Gilad Koch on 04/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "Deck.h"
#import "SetCardAttributesEnums.h"
NS_ASSUME_NONNULL_BEGIN

@interface SetCard : Card


@property (nonatomic) int numberOfShapes;
@property (nonatomic) Shadings shading;
@property (nonatomic) Shapes shape;
@property (nonatomic) ShapeColors color;


+ (NSString *) cardShadingStringFromAlpha: (Shadings)alphaValue;
+ (NSString *) colorStringFromShapeColorEnum:(ShapeColors) shapeColor;
+ (float) alphaValueFromShadingEnum: (Shadings) shading;
+ (NSString *)shpaeStringFromShapeEnum:(Shapes)shape;
+ (NSArray *)shapes;
+ (NSArray *)shapeColors;
+ (NSInteger)maxShapesNumber;
+ (NSArray *)shapeAlphaValues;

@end

NS_ASSUME_NONNULL_END
