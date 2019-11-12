//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Gilad Koch on 04/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetCardShape.h"

@implementation SetCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (int cardNumberOfShapes = 1; cardNumberOfShapes <= [SetCard maxShapesNumber]; cardNumberOfShapes++) {
            for (int i = firstShape; i <= lastShape; i++) {
                for (int j =firstShading; j <= lastShading; j++) {
                    for (int k = firstShapeColor; k <= lastShapeColor ; k++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.numberOfShapes = cardNumberOfShapes;
                        card.shape = i;
                        card.shading = j;
                        card.color = k;
                        
                        [self addCard:card];
                    }
                }
            }
        }
    }
    
    return self;
}

@end
