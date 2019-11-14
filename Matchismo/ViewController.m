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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Grid *cardsLayoutGrid;
@property (weak, nonatomic) IBOutlet UIView *cardLayoutBoundaries;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet MatchismoCardView *testDelete;


@end

@implementation ViewController

- (CardGame *) game
{
    return nil;
}


#define CARD_ASPECT_RATIO 2.0 / 3.0

- (Grid *)cardsLayoutGrid
{
    if (!_cardsLayoutGrid) {
        _cardsLayoutGrid = [[Grid alloc] init];
        _cardsLayoutGrid.size = self.cardLayoutBoundaries.bounds.size;
        _cardsLayoutGrid.cellAspectRatio = CARD_ASPECT_RATIO;
    }
    
    _cardsLayoutGrid.minimumNumberOfCells = self.game.numberOfCards;
    
    return _cardsLayoutGrid;
}

-(Deck *)createDeck
{
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    int cardCellRow = (int) 9 / self.cardsLayoutGrid.columnCount;
//    int cardCellCol = (int) (9 - self.cardsLayoutGrid.columnCount * cardCellRow);
//
    //    CGRect rect = [self.cardsLayoutGrid frameOfCellAtRow:cardCellRow inColumn:cardCellCol];
    
    
    //    [self updateUi];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    SetCardView *mv = [[SetCardView alloc] initWithFrame:[self.cardsLayoutGrid frameOfCellAtRow:0 inColumn:0]];
    [self.cardLayoutBoundaries addSubview:mv];
    mv.shading = solid;
    mv.numberOfShapes = 3;
    mv.shape = diamond;
    mv.shapeColor = blue;
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


@end
