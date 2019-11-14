//
//  CardGame.m
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "CardGame.h"
#import "Deck.h"
@interface CardGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) NSArray *cards;

@end

@implementation CardGame

- (NSArray *)lastRoundMatchedCards
{
    if (!_lastRoundMatchedCards) {
        _lastRoundMatchedCards = [[NSArray alloc] init];
    }
    
    return _lastRoundMatchedCards;
}

- (NSArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (NSUInteger)numberOfCards
{
    return [self.cards count];
}

- (void)redeal { }

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

static const int MAX_ROUNDS_SAMMARIES = 30;

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
