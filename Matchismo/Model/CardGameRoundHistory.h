//
//  CardGameRoundHistory.h
//  Matchismo
//
//  Created by Gilad Koch on 07/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardGameRoundHistory : NSObject

@property (nonatomic, strong) NSArray *roundCards;

@property (nonatomic) NSInteger roundScore;

@end

NS_ASSUME_NONNULL_END
