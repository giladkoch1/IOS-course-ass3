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
#import "GameHistoryViewController.h"
#import "CardGameRoundHistory.h"
#import "Grid.h"

@interface ViewController ()
@property (strong, nonatomic) CardGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Grid *cardsLayoutGrid;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

- (CardGame *) game
{
    return nil;
}

//- (Grid *)cardsLayoutGrid
//{
//    _cardsLayoutGrid = [[Grid alloc] init];
//    _cardsLayoutGrid.size = self.
//}

//- (NSUInteger) numCardsToMatch
//{
//    return [[self.gameModeSegmentControl titleForSegmentAtIndex:self.gameModeSegmentControl.selectedSegmentIndex]substringToIndex:1].intValue;
//}

-(Deck *)createDeck
{
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUi];
    // Do any additional setup after loading the view.
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUi];
}

- (IBAction)resetGame:(id)sender
{
    self.game = nil;
    [self updateUi];
    self.game = nil;
}

- (NSAttributedString *) historyAttributedString: (NSMutableArray *) gameHistory
{
    NSMutableAttributedString *historyAttributedString = [[NSMutableAttributedString alloc] init];
    
    for (CardGameRoundHistory *roundHistory in gameHistory) {
        [historyAttributedString appendAttributedString:[self singleRoundSummaryAsAttributedString: roundHistory]];
        [historyAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Score %ld\n", roundHistory.roundScore]]];
    }
    
    return historyAttributedString;
}

- (void)updateUi
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %ld", self.game.score];
    }
}


- (NSMutableAttributedString *)titleForCard:(Card *)card
{
    return nil;
}
	
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return nil;
}

- (NSMutableAttributedString *)singleRoundSummaryAsAttributedString:(CardGameRoundHistory *)lastRoundSummary
{
    NSMutableAttributedString *labelAttributedString = [[NSMutableAttributedString alloc] init];
    
    for (Card *card in lastRoundSummary.roundCards) {
        [labelAttributedString appendAttributedString:[self titleForCard:card]];
        [labelAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
    }
    
    return labelAttributedString;
}


@end
