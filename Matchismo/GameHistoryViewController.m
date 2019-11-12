//
//  GameHistoryViewController.m
//  Matchismo
//
//  Created by Gilad Koch on 05/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import "GameHistoryViewController.h"

@interface GameHistoryViewController ()
//@property (nonatomic, readwrite) NSString *gameHistory;
@property (weak, nonatomic) IBOutlet UITextView *GameHistoryTextView;

@end

@implementation GameHistoryViewController


- (void)setGameHistory:(NSAttributedString *)gameHistory
{
    _gameHistory = gameHistory;
    if (self.view.window) [self updateUi];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUi];
}

- (void)updateUi
{
    self.GameHistoryTextView.attributedText = self.gameHistory;
}

@end
