//
//  PlayingCard.h
//  Matchismo
//
//  Created by Gilad Koch on 29/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

NS_ASSUME_NONNULL_END
