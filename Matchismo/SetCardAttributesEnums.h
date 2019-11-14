//
//  SetCardAttributesEnums.h
//  Matchismo
//
//  Created by Gilad Koch on 13/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum  {oval, squigle, diamond, firstShape = oval, lastShape = diamond} Shapes;
typedef enum  {green, purple, blue, firstShapeColor = green, lastShapeColor = blue} ShapeColors;
typedef enum  {clear, stripe, solid, firstShading = clear, lastShading = solid} Shadings;

@interface SetCardAttributesEnums : NSObject

@end

NS_ASSUME_NONNULL_END
