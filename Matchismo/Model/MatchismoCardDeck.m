//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Gilad Koch on 29/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "MatchismoCardDeck.h"
#import "PlayingCard.h"

@implementation MatchismoCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
