//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Gilad Koch on 30/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "MatchismoGame.h"
#import "PlayingCard.h"

@interface MatchismoGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) NSMutableArray *chosenUnmatchedCards;
@property (nonatomic, readonly) NSUInteger numCardsToMatch;

@end

@implementation MatchismoGame

- (NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}


- (void)redeal
{
    
}

- (NSMutableArray *) chosenUnmatchedCards
{
    if (!_chosenUnmatchedCards) {
        _chosenUnmatchedCards = [[NSMutableArray alloc] init];
    }
    
    return _chosenUnmatchedCards;
}


static const int NUM_CARDS_TO_MATCH = 2;
static const int MISMATCH_PENATLTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            [self.chosenUnmatchedCards removeObject:card];
            card.chosen = NO;
            
        } else {
            [self.chosenUnmatchedCards addObject:card];
            
            if ([self.chosenUnmatchedCards count] == NUM_CARDS_TO_MATCH) {
                int matchScore = [self match:self.chosenUnmatchedCards];
                
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    
                    for (Card *otherCard in self.chosenUnmatchedCards) {
                        otherCard.matched = YES;
                    }
                    
                    card.matched = YES;
                    //[self.chosenUnmatchedCards removeAllObjects];
                    self.chosenUnmatchedCards = nil;
                } else {
                    self.score -= MISMATCH_PENATLTY;
                    
                    for (Card *otherCard in self.chosenUnmatchedCards) {
                        otherCard.chosen = NO;
                    }
                    
                    //[self.chosenUnmatchedCards removeAllObjects];
                    self.chosenUnmatchedCards = nil;
                    [self.chosenUnmatchedCards addObject:card];
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (int)match:(NSArray *)cards
{
    int score = 0;
    
    for (int i = 0; i < [cards count] - 1; i++) {
        for (int j = i + 1; j < [cards count]; j++) {
            if (((PlayingCard *)cards[i]).rank == ((PlayingCard *)cards[j]).rank) {
                score = MAX(score * 4, 4);
            } else if ([((PlayingCard *)cards[i]).suit isEqualToString:((PlayingCard *)cards[j]).suit]) {
                score = MAX(score * 2, 2);
            }
        }
    }
    
    return score;
}


@end
