//
//  ViewController.h
//  Matchismo
//
//  Created by Gilad Koch on 28/10/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Card.h"
@interface ViewController : UIViewController

- (Deck *)  createDeck;

@property (nonatomic, strong) NSArray * CardViews;

@end

