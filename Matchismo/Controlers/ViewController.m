//
//  ViewController.m
//  Matchismo
//
//  Created by Gilad Koch on 28/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "ViewController.h"
#import "MatchismoCardDeck.h"
#import "PlayingCard.h"
#import "MatchismoGame.h"
#import "Grid.h"
#import "MatchismoCardView.h"
#import "SetCardView.h"
#import "SetCardAttributesEnums.h"

@interface ViewController ()
@property (strong, nonatomic) CardGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet MatchismoCardView *testDelete;


@end

@implementation ViewController

- (CardGame *) game
{
    return nil;
}

- (void)updateCardVies {}



#define CARD_ASPECT_RATIO 2.0 / 3.0

- (Grid *)cardsLayoutGrid
{
    _cardsLayoutGrid = [[Grid alloc] init];
    _cardsLayoutGrid.size = self.cardLayoutBoundaries.bounds.size;
    _cardsLayoutGrid.cellAspectRatio = CARD_ASPECT_RATIO;
    _cardsLayoutGrid.minimumNumberOfCells = self.game.numOfCards;
    
    return _cardsLayoutGrid;
}

- (CardView *)cardViewFromCard:(PlayingCard *)card {
    return nil;
}

- (void)animateCards {}

- (Deck *)createDeck
{
    return nil;
}

- (NSMutableArray *)viewsAndAssociatedCards {
    if (!_viewsAndAssociatedCards) {
        _viewsAndAssociatedCards = [[NSMutableArray alloc] init];
    }
    
    return _viewsAndAssociatedCards;
}

- (IBAction)dealButton:(id)sender {
    [self dealCards:[self numOfNewCards]];
    [self updateUi];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dealCards:[self initialNumOfCards]];
    [self updateUi];
}

- (void)viewWillAppear:(BOOL)animated {
    [self orientationChanged:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
       addObserver:self selector:@selector(orientationChanged:)
       name:UIDeviceOrientationDidChangeNotification
       object:[UIDevice currentDevice]];
}

- (void) orientationChanged:(NSNotification *)note
{
    for (CardViewAndAssociatedCard *container in self.viewsAndAssociatedCards) {
        NSUInteger cardIndex = [self.viewsAndAssociatedCards indexOfObject:container];
        CGRect newFrame = [self cardFrame:cardIndex];
        container.view.frame = newFrame;
    }
}

- (IBAction)resetGame:(id)sender {
    for (CardViewAndAssociatedCard *container in self.viewsAndAssociatedCards) {
        [container.view removeFromSuperview];
        
    }
    
    [self.viewsAndAssociatedCards removeAllObjects];
    self.game = nil;
    [self dealCards:[self initialNumOfCards]];
    [self updateUi];
//    self.game = nil;
//    [self updateUi];
//    self.game = nil;
}

- (void)updateUi {
    NSMutableArray *matched = [[NSMutableArray alloc] init];
    
    for (CardViewAndAssociatedCard *container in self.viewsAndAssociatedCards) {
        if (container.card.matched) {
            [matched addObject:container];
            [UIView animateWithDuration:0.5 animations:^(){
                container.view.alpha = 0;
            } completion:^(BOOL finished) {
                [container.view removeFromSuperview];
            }];
        }
    }
    
    [self.viewsAndAssociatedCards removeObjectsInArray:matched];
    
    [self animateCards];
    self.scoreLabel.text = [[NSString alloc] initWithFormat:@"score: %ld", self.game.score];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    
    //    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    if ([recognizer.view isKindOfClass:[CardView class]]) {
        CardView *view = (CardView *)recognizer.view;
        Card *associtedCard = [self cardViewAssociatedCard:view];
        
        [self.game playCard:associtedCard];
        [self updateUi];
    }
}

- (Card *)cardViewAssociatedCard: (CardView *)cardView {
    Card *card;
    
    for (CardViewAndAssociatedCard * container in self.viewsAndAssociatedCards) {
        if (cardView == container.view) {
            return container.card;
            break;
        }
    }
    
    return card;
}

- (CGRect)cardFrame:(NSUInteger)cardIndex {
    int row = (int) (cardIndex / self.cardsLayoutGrid.columnCount);
    int col = (int) (cardIndex - self.cardsLayoutGrid.columnCount * row);
    CGRect cardFrame = [self.cardsLayoutGrid frameOfCellAtRow:row inColumn:col];
    
    return cardFrame;
}

- (void) dealCards: (NSUInteger) numCards  {
    NSArray *newCards = [self.game dealCards:numCards];
    
    for (Card *card in newCards) {
        CardView *cardView = [self cardViewFromCard:card];
        
        [self.cardLayoutBoundaries addSubview:cardView];
        
        CardViewAndAssociatedCard *container = [[CardViewAndAssociatedCard alloc] init];
        container.card = card;
        container.view = cardView;
        [self.viewsAndAssociatedCards addObject:container];
    }
}

- (CGRect)initialCardFrame {
    return CGRectMake(-1000, -1000, 10, 10);
}

- (NSUInteger)initialNumOfCards {
    return 0;
}

- (NSUInteger)numOfNewCards
{
    return 0;
}

@end
