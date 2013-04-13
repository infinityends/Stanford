//
//  ViewController.m
//  CardGame
//
//  Created by Justin Rasmussen on 2/3/13.
//  Copyright (c) 2013 Justin Rasmussen. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;

@end

@implementation ViewController


-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"FlipCount = %d", self.flipCount);
}

- (PlayingCardDeck *) deck {
    if (!_deck){
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (IBAction)flipCard:(UIButton *)sender {
    
    /*if (!sender.isSelected){
        sender.selected = YES;
    }
    if(sender.isSelected){
        sender.selected = NO;
    }*/
    //Cleaner method for above code
    sender.selected = !sender.isSelected;
    
    if(sender.isSelected){
        NSLog(@"Card Face Up");
        
        Card *card = [[PlayingCard alloc] init];
        card = self.deck.drawRandomCard;
        
        NSString *details = card.contents;
        NSLog(@"%@", details);
        [sender setTitle:(@"%@", details) forState:UIControlStateSelected];

        
    }
    
    self.flipCount++;
    
    
}

@end
