//
//  CardView.h
//  Matchismo
//
//  Created by Gilad Koch on 13/11/2019.
//  Copyright © 2019 Gilad Koch. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface CardView : UIView

- (void) drawRect: (CGRect)rect;
- (void)pushContextAndRotate;
- (void)popContext;
- (CGFloat) cornerScaleFactor;
- (CGFloat) cornerRadius;
- (CGFloat) cornerOffset;

@property (nonatomic) BOOL isChosen;



@end

NS_ASSUME_NONNULL_END
