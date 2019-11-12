//
//  CardGame.h
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "CardGameRoundHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardGame : NSObject

- (id) initWithCardCount: (NSUInteger) count
                         usingDeck: (Deck *)deck numCardsToMatch: (NSUInteger) numCardsToMatch;
- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card *) cardAtIndex:(NSUInteger) index;
- (void)updateGameRoundsSummaries;
- (void) redeal;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) CardGameRoundHistory *lastRoundSummary;
@property (nonatomic, readonly) NSMutableArray *gameSummariesHistory;

@end

NS_ASSUME_NONNULL_END
