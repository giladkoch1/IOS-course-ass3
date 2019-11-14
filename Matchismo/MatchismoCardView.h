//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Gilad Koch on 10/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MatchismoCardView : CardView


@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;



@end

NS_ASSUME_NONNULL_END
