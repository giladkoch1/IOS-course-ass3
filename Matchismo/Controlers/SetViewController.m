//
//  SetViewController.m
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "SetViewController.h"
#import "SetCardDeck.h"
#import "SetGame.h"
#import "SetCard.h"
#import "SetCardView.h"

@interface SetViewController ()
@property (strong, nonatomic) SetGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation SetViewController

#define INIT_CARD_COUNT 12

- (SetGame *) game {
 if (!_game) {
        _game = [[SetGame alloc] initWithCardCount:INIT_CARD_COUNT
                                                             usingDeck:[self createDeck] numCardsToMatch:0];
    }
    
    return _game;
}

-(Deck *)createDeck {
    return [[SetCardDeck alloc] init];
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"setCardChosen" : @"setCardNeutral"];
}

- (CardView *)cardViewFromCard:(SetCard *)card {
    SetCardView *cardView = [[SetCardView alloc] initWithFrame:[self initialCardFrame]];
    
    UITapGestureRecognizer *singleFingerTap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleSingleTap:)];
    
    [cardView addGestureRecognizer:singleFingerTap];
    
    cardView.numberOfShapes = card.numberOfShapes;
    cardView.shading = card.shading;
    cardView.shape = card.shape;
    cardView.shapeColor = card.color;
    
    return cardView;
}

- (void)animateCards {
    for (CardViewAndAssociatedCard *container in self.viewsAndAssociatedCards) {
        
        CGFloat newAlpha = container.card.chosen ? 0.7 : 1.0;

        [UIView animateWithDuration:0.2 animations:^(){
            container.view.alpha = newAlpha;
        }];
        
        
        NSUInteger cardIndex = [self.viewsAndAssociatedCards indexOfObject:container];
        CGRect newFrame = [self cardFrame:cardIndex];

        [UIView animateWithDuration:0.8 animations:^(){
            container.view.frame = newFrame;
        }];
    }
}

- (NSUInteger)initialNumOfCards {
    return INIT_CARD_COUNT;
}

- (NSUInteger)numOfNewCards {
    return 3;
}

@end
