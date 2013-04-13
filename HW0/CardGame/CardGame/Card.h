//
//  Card.h
//  CardGame
//
//  Created by Justin Rasmussen on 2/10/13.
//  Copyright (c) 2013 Justin Rasmussen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

-(int)match:(NSArray *)otherCards;

@end
