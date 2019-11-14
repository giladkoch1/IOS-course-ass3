//
//  SetGame.m
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "SetGame.h"
#import "SetCard.h"

@interface SetGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) NSMutableArray *chosenCards;


@end

@implementation SetGame

static const int SET_GAME_NUM_CARDS_TO_MATCH = 3;
static const int MISMATCH_PENATLTY = 20;


- (void) redeal
{
    Card *newDealtCard;
    
    for (int i = 0; i < SET_GAME_NUM_CARDS_TO_MATCH; i++) {
        newDealtCard = [self.deck drawRandomCard];
        
        if (newDealtCard) {
            [self.cards addObject:newDealtCard];
        }
    }
}

- (NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}


- (NSMutableArray *) chosenCards
{
    if (!_chosenCards) {
        _chosenCards = [[NSMutableArray alloc] init];
    }
    
    return _chosenCards;
}


- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            [self.chosenCards removeObject:card];
            card.chosen = NO;
        } else {
            card.chosen = YES;

            [self.chosenCards addObject:card];
                        
            if ([self.chosenCards count] == SET_GAME_NUM_CARDS_TO_MATCH) {
                int roundScore = [self match:self.chosenCards];
                self.score += roundScore;
                
                if (roundScore > 0) {
                    [self.cards removeObjectsInArray:self.chosenCards];

                    self.chosenCards = nil;
                } else {                    
                    for (Card *chosenCard in self.chosenCards) {
                        chosenCard.chosen = NO;
                    }

                    self.chosenCards = nil;
                }
            }
        }
    }
}

static const int SET_REWARD = 10;

- (int)match:(NSArray *)cards
{
    if ([cards count] != SET_GAME_NUM_CARDS_TO_MATCH) {
        return 0;
    }
    
    int score = 0;
    
    SetCard *first = (SetCard *)cards[0];
    SetCard *second = (SetCard *)cards[1];
    SetCard *third = (SetCard *)cards[2];
    
    
    if (((first.shading == second.shading  && second.shading == third.shading) ||
         (first.shading != second.shading && second.shading != third.shading && first.shading != third.shading)) &&
        ((first.numberOfShapes == second.numberOfShapes && second.numberOfShapes == third.numberOfShapes) || (first.numberOfShapes != second.numberOfShapes && second.numberOfShapes != third.numberOfShapes && first.numberOfShapes != third.numberOfShapes)) &&
        ((first.color == second.color  && second.color == third.color) ||
         (first.color != second.color && second.color != third.color && first.color != third.color)) &&
        ((first.shape == second.shape  && second.shape == third.shape) ||
         (first.shape != second.shape && second.shape != third.shape && first.shape != third.shape))){
        score = SET_REWARD;
    } else {
        score = MISMATCH_PENATLTY * -1;
    }
    
    return score;
}

@end
