//
//  PlayingCard.m
//  CardGame
//
//  Created by Justin Rasmussen on 2/10/13.
//  Copyright (c) 2013 Justin Rasmussen. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards
{
    int score=0;
    
    if (otherCards.count ==1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score=1;
        } else if (otherCard.rank == self.rank){
            score = 4;
        }
    }
    
    return score;
}

-(NSString *) contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[@"♥", @"♦", @"♠", @"♣"];
}

+(NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank{
    return [self rankStrings].count-1;
}

- (void)setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

- (void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits]containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

@end
