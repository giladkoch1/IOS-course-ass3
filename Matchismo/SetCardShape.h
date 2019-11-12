//
//  SetCardShape.h
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetCardShape : NSObject

@property (nonatomic) NSInteger alpha;
@property (nonatomic, strong) NSString *shape;
@property (nonatomic, strong) NSString *color;

@end

NS_ASSUME_NONNULL_END
