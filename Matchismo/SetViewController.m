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

- (SetGame *) game
{
 if(!_game) {
        _game = [[SetGame alloc] initWithCardCount:INIT_CARD_COUNT
                                                             usingDeck:[self createDeck] numCardsToMatch:0];
    }
    
    return _game;
}

-(Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"setCardChosen" : @"setCardNeutral"];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    
    //    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    if ([recognizer.view isKindOfClass:[CardView class]]) {
        CardView *view = (CardView *)recognizer.view;
        Card *associtedCard = [self getAssociatedCard:view];
        associtedCard.chosen = !associtedCard.chosen;
        CGFloat newAlpha = associtedCard.chosen ? 0.5 : 1.0;
        
        [UIView animateWithDuration:0.1 animations:^(){
            view.alpha = newAlpha;
        }];
    }
    
    [super handleSingleTap:recognizer];
}


- (void) updateCardsViewAndAssociatedCards
{
    self.cardsLayoutGrid.minimumNumberOfCells = [self.game numberOfCards];
    
    for (int i = 0; i < [self.game numberOfCards]; i++) {
        SetCard *card = (SetCard *)[self.game cardAtIndex:i];
        
        int row = (int) (i / self.cardsLayoutGrid.columnCount);
        int col = (int) (i - self.cardsLayoutGrid.columnCount * row);
        CGRect cardFrame = [self.cardsLayoutGrid frameOfCellAtRow:row inColumn:col];
        
        SetCardView *cardView = [[SetCardView alloc] initWithFrame:cardFrame];
        
        UITapGestureRecognizer *singleFingerTap =
          [[UITapGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(handleSingleTap:)];
        
        [cardView addGestureRecognizer:singleFingerTap];
        
        cardView.numberOfShapes = card.numberOfShapes;
        cardView.shading = card.shading;
        cardView.shape = card.shape;
        cardView.shapeColor = card.color;
        
        [self.cardLayoutBoundaries addSubview:cardView];
        CardViewAndAssociatedCard *container = [[CardViewAndAssociatedCard alloc] init];
        container.card = card;
        container.view = cardView;
        [self.viewsAndAssociatedCards addObject:container];
    }
}

@end
