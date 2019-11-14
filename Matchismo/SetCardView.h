//
//  SetCardView.h
//  Matchismo
//
//  Created by Gilad Koch on 13/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "CardView.h"
#import "SetCardAttributesEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetCardView : CardView

@property (nonatomic) NSUInteger numberOfShapes;
@property (nonatomic) Shapes shape;
@property (nonatomic) Shadings shading;
@property (nonatomic) ShapeColors shapeColor;

@end

NS_ASSUME_NONNULL_END
