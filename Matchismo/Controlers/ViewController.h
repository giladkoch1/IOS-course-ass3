//
//  ViewController.h
//  Matchismo
//
//  Created by Gilad Koch on 28/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Card.h"
#import "Grid.h"
#import "CardViewAndAssociatedCard.h"

@interface ViewController : UIViewController

- (Deck *)createDeck;
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer;
- (Card *)cardViewAssociatedCard: (CardView *)cardView;
- (CardView *)cardViewFromCard: (Card *)card;
- (CGRect)cardFrame: (NSUInteger)cardIndex;
- (CGRect)initialCardFrame;
- (NSUInteger)numOfNewCards;
- (void)animateCards;

 
@property (nonatomic, strong) NSArray * CardViews;
@property (strong, nonatomic) Grid *cardsLayoutGrid;
@property (strong, nonatomic) NSMutableArray *viewsAndAssociatedCards;
@property (weak, nonatomic) IBOutlet UIView *cardLayoutBoundaries;
@property (nonatomic) NSUInteger initialNumOfCards;

@end

