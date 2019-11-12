//
//  CardGameRoundHistory.m
//  Matchismo
//
//  Created by Gilad Koch on 07/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "CardGameRoundHistory.h"

@implementation CardGameRoundHistory

- (NSArray *)roundCards
{
    if (!_roundCards) {
        _roundCards = [[NSArray alloc] init];
    }
    
    return _roundCards;
}

@end
