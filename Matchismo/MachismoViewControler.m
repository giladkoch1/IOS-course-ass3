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

#define INIT_CARD_COUNT 15

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


@end
