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

@interface SetViewController ()
@property (strong, nonatomic) SetGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation SetViewController


- (SetGame *) game
{
 if(!_game) {
        _game = [[SetGame alloc] initWithCardCount:[self.cardButtons count]
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

- (NSMutableAttributedString *)titleForCard:(SetCard *)card
{
    NSString *tilteString = [[NSString alloc] init];
    
    for (int i = 0; i < card.numberOfShapes; i++) {
        tilteString = [[NSString alloc] initWithFormat:@"%@%@", [SetCard shpaeStringFromShapeEnum:card.shape], tilteString];
    }
    
    UIColor *color = [self colorFromShapeColorEnum:card.color withAlpha:card.shading];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:[[NSString alloc]initWithString:tilteString]];
    [title setAttributes:@{NSStrokeWidthAttributeName: @-3,
                           NSStrokeColorAttributeName: [color colorWithAlphaComponent:1],
                           NSForegroundColorAttributeName: color
    } range:NSMakeRange(0, [title length])];

    return title;
}



- (UIColor *) colorFromShapeColorEnum:(ShapeColors) shapeColor withAlpha:(Shading) alpha
{
    UIColor *color = [self colorFromShapeColorEnum:shapeColor];
    return [color colorWithAlphaComponent:[SetCard alphaValueFromShadingEnum:alpha]];
}


- (UIColor *) colorFromShapeColorEnum:(ShapeColors) shapeColor
{
    UIColor *color = nil;
    
    switch (shapeColor) {
        case blue:
            color = [UIColor blueColor];
            break;
        case green:
            color = [UIColor greenColor];
            break;
        case purple:
            color = [UIColor purpleColor];
            break;
    }
    
    return color;
}

@end
