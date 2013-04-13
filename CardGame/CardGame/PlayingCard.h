//
//  PlayingCard.h
//  CardGame
//
//  Created by Justin Rasmussen on 2/10/13.
//  Copyright (c) 2013 Justin Rasmussen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic)NSString *suit;
@property(nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
