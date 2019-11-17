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
@property (nonatomic, readwrite) NSMutableArray *cards;

@end

@implementation CardGame

@synthesize cards = _cards;

- (NSArray *)lastRoundMatchedCards
{
    if (!_lastRoundMatchedCards) {
        _lastRoundMatchedCards = [[NSArray alloc] init];
    }
    
    return _lastRoundMatchedCards;
}

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (void)setCards:(NSMutableArray *)cards {
    _cards = cards;
}

- (NSUInteger)indexOfCard:(Card *)card {
    return [self.cards indexOfObject:card];
}

- (NSUInteger)numOfCards
{
    return [self.cards count];
}

- (NSArray *) dealCards: (NSUInteger)numCards {
    NSMutableArray *newCards = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < numCards; i++) {
        Card *card = [self.deck drawRandomCard];
        
        if (card) {
            [newCards addObject:card];
        } else {
            break;
        }
        
    }
    
    [self.cards addObjectsFromArray:newCards];
    return newCards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck numCardsToMatch:(NSUInteger)numCardsToMatch
{
    self = [super init];
    self.deck = deck;
    return self;
}

- (void)playCard:(Card *)index{
    
}

static const int MAX_ROUNDS_SAMMARIES = 30;

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
