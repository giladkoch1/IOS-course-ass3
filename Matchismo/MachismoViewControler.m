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

@interface MachismoViewControler ()
@property (strong, nonatomic) MatchismoGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation MachismoViewControler


- (MatchismoGame *) game
{
    if(!_game) {
        _game = [[MatchismoGame alloc] initWithCardCount:[self.cardButtons count]
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

- (NSMutableAttributedString *)singleRoundSummaryAsAttributedString:(Card *)card
{
    return [[NSMutableAttributedString alloc] initWithString:self.game.lastRoundSummary];
}

@end
