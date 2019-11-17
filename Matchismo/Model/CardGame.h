//
//  CardGame.h
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardGame : NSObject

- (id) initWithCardCount: (NSUInteger) count
                         usingDeck: (Deck *)deck numCardsToMatch: (NSUInteger) numCardsToMatch;
- (void) playCard: (Card *) card;
- (Card *) cardAtIndex:(NSUInteger) index;
- (NSUInteger) indexOfCard:(Card *)card;
- (NSArray *) dealCards: (NSUInteger)numCards;
- (NSUInteger) numOfCards;


@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong) NSArray *lastRoundMatchedCards;
@property (nonatomic, readonly) NSMutableArray *cards;


@end

NS_ASSUME_NONNULL_END
