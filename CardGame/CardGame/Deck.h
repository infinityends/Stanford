//
//  Deck.h
//  CardGame
//
//  Created by Justin Rasmussen on 2/3/13.
//  Copyright (c) 2013 Justin Rasmussen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *) drawRandomCard;

@end
