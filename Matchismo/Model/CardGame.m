//
//  CardGame.m
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "CardGame.h"
#import "CardGameRoundHistory.h"
#import "Deck.h"
@interface CardGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) CardGameRoundHistory *lastRoundSummary;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) NSArray *cards;
@property (nonatomic, readwrite) NSMutableArray * gameSummariesHistory;
@end

@implementation CardGame

- (NSArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (void)redeal { }

- (NSMutableArray *) gameSummariesHistory
{
    if (!_gameSummariesHistory) {
        _gameSummariesHistory = [[NSMutableArray alloc] init];
    }
    
    return _gameSummariesHistory;
}
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck numCardsToMatch:(NSUInteger)numCardsToMatch
{
    self = [super init];
    self.deck = deck;
    NSMutableArray *cards = [[NSMutableArray alloc] init];

    if (self) {
        for (int i = 0; i < count; i++) {
            Card * card = [deck drawRandomCard];
            if (card) {
                [cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    self.cards = [cards copy];

    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index{}

- (CardGameRoundHistory *)lastRoundSummary
{
    return [self.gameSummariesHistory lastObject];
}

- (void) setLastRoundSummary:(CardGameRoundHistory *)lastRoundSummary
{
    [self.gameSummariesHistory addObject:lastRoundSummary];
}

static const int MAX_ROUNDS_SAMMARIES = 30;


- (void)updateGameRoundsSummaries
{
    if ([self.gameSummariesHistory count] > MAX_ROUNDS_SAMMARIES) {
        [self.gameSummariesHistory removeObjectAtIndex:0];
    }
    
    [self.gameSummariesHistory addObject:self.lastRoundSummary];
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
