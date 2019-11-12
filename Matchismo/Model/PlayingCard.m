//
//  PlayingCard.m
//  Matchismo
//
//  Created by Gilad Koch on 29/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;

    for (PlayingCard *otherCard in otherCards) {
        if (otherCard.rank == self.rank) {
            score = MAX(score * 4, 4);
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = MAX(score * 2, 2);
        }
    }
    
    return score;
}

- (NSString *)contents
{
    NSArray *rankString = [PlayingCard rankStrings];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♥︎", @"♣︎", @"♠︎", @"♦︎"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
