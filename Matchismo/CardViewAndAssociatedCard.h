//
//  CardViewAndCardContainer.h
//  Matchismo
//
//  Created by Gilad Koch on 14/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardView.h"
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardViewAndAssociatedCard : NSObject

@property (nonatomic, strong) CardView *view;
@property (nonatomic, strong) Card *card;
@end

NS_ASSUME_NONNULL_END
