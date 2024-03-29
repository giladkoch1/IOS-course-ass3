//
//  Card.m
//  Matchismo
//
//  Created by Gilad Koch on 29/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
