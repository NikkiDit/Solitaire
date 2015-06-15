//
//  CardView.m
//  Solitaire
//
//  Created by Adenike Olatunji on 13/06/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import "CardView.h"

@implementation CardView
- (id)initWithRank:(NSNumber *)rank suit:(NSString*)suit{
    self = [super init];
    if(!self) { return nil; }
    
    _rank = rank;
    _suit = suit;
    return self;
}

-(void)setSuit:(NSString *)suit
{
    _suit =suit;
    [self setNeedsDisplay];
}

-(void)setRank:(NSNumber *)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}




-(NSMutableArray *) setUp{
    // create the card deck array
    NSMutableArray *deck = [[NSMutableArray alloc] init];
    
    
    NSArray *suits = @[@"♣", @"♥", @"♠", @"♦"];
    
    
    NSArray *rankAsString= @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"] ;
    for(NSString *suit in suits){
        for (NSNumber *rank in rankAsString) {
            CardView *cardView = [[CardView alloc] initWithRank:rank suit:suit];
            [deck addObject:cardView];
        }
        
    }
    
    //  shuffle the card deck array
    
    for (NSUInteger i = [deck count] - 1; i > 0; i--) {
        NSUInteger n = arc4random_uniform(i + 1);
        [deck exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    return deck;
}
- (NSString*)description{
    return [NSString stringWithFormat:@"%@%@",_rank,_suit];
}

@end
