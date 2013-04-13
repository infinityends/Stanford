//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Justin Rasmussen on 3/31/13.
//  Copyright (c) 2013 Justin Rasmussen. All rights reserved.
//

#import "CardMatchingGame.h"


//@interface provides the private methods for a class
@interface CardMatchingGame()

@property (strong, nonatomic)NSMutableArray *cards;
@property (nonatomic) int score;

@end


@implementation CardMatchingGame

- (NSMutableArray *) Cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (id) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if (self) {
        for (int i=0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            NSLog(@"card contents in cmd.h %@",card.contents);
            NSLog(@"i = %d", i);
            if (!card) {
                self=nil;
                NSLog(@"card is nil");
            }else{
                self.cards[i] = card;
                NSLog(@"card contents in cmd.h part2 %@",self.cards[i]);

            }
        }
        
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

-(void)flipCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            //see if flipping this card creates a match
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
