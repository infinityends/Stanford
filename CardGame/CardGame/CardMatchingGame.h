//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Justin Rasmussen on 3/31/13.
//  Copyright (c) 2013 Justin Rasmussen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//Designated Initializer
-(id)initWithCardCount:(NSUInteger)CardFlipCount
             usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end
