//
//  CardView.h
//  Solitaire
//
//  Created by Adenike Olatunji on 13/06/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property(nonatomic) NSNumber *rank;

@property(nonatomic, strong) NSString *suit;

@property (nonatomic, getter=isChosen) BOOL *chosen; //to change the name of the getter
@property (nonatomic, getter=isMatched) BOOL *matched;



- (id)initWithRank:(NSNumber *)rankString suit:(NSString*)suit;


-(NSMutableArray *)setUp;





@end
