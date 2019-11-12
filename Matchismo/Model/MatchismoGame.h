//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Gilad Koch on 30/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "CardGame.h"

NS_ASSUME_NONNULL_BEGIN

@interface MatchismoGame : CardGame
@property (nonatomic, readwrite) NSMutableArray *gameRoundsSummaries;


//- (instancetype) initWithCardCount: (NSUInteger) count
//                         usingDeck: (Deck *)deck numCardsToMatch: (NSUInteger) numCardsToMatch;;
//- (void) chooseCardAtIndex: (NSUInteger) index;
//- (Card *) cardAtIndex:(NSUInteger) index;
//
//@property (nonatomic, readonly) NSInteger score;
//@property (nonatomic, readonly) NSString *lastRoundSummary;
@end

NS_ASSUME_NONNULL_END
