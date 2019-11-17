//
//  MachismoViewControler.m
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "MachismoViewControler.h"
#import "MatchismoCardDeck.h"
#import "MatchismoGame.h"
#import "PlayingCard.h"
#import "MatchismoCardView.h"
#import "PlayingCard.h"

@interface MachismoViewControler ()
@property (strong, nonatomic) MatchismoGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation MachismoViewControler

#define INIT_CARD_COUNT 16

- (MatchismoGame *) game
{
    if(!_game) {
        _game = [[MatchismoGame alloc] initWithCardCount:INIT_CARD_COUNT
                                                             usingDeck:[self createDeck] numCardsToMatch:2];
    }
    
    return _game;
}

-(Deck *)createDeck
{
    return [[MatchismoCardDeck alloc] init];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSMutableAttributedString *)titleForCard:(Card *)card
{
    return [[NSMutableAttributedString alloc] initWithString: card.isChosen ? card.contents : @""];
}

- (CardView *)cardViewFromCard:(PlayingCard *)card {
    MatchismoCardView *cardView = [[MatchismoCardView alloc] initWithFrame:[self initialCardFrame]];
    
    UITapGestureRecognizer *singleFingerTap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleSingleTap:)];
    
    [cardView addGestureRecognizer:singleFingerTap];
    
    cardView.rank = card.rank;
    cardView.suit = card.suit;
    
    return cardView;
}

- (void)animateCards {
    for (CardViewAndAssociatedCard *container in self.viewsAndAssociatedCards) {
        NSUInteger cardIndex = [self.viewsAndAssociatedCards indexOfObject:container];
        CGRect newFrame = [self cardFrame:cardIndex];
        
        if (container.card.isChosen != container.view.isChosen) {
            [UIView transitionWithView:container.view
                                      duration:1.0
                                       options:UIViewAnimationOptionTransitionFlipFromLeft
                                    animations:^{
                        container.view.isChosen=container.card.isChosen;
                    }
                                    completion:^(BOOL finished) {
                    }];
        }
        
        [UIView animateWithDuration:0.8 animations:^(){
            container.view.frame = newFrame;
        }];
    }
}

- (NSUInteger)initialNumOfCards {
    return INIT_CARD_COUNT;
}

- (NSUInteger)numOfNewCards {
    return 2;
}



@end
