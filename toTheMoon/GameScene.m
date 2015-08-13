//
//  GameScene.m
//  toTheMoon
//
//  Created by LinHanshu on 4/21/15.
//  Copyright (c) 2015 LinHanshu. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    /* Setup your scene here */
    SKSpriteNode *startBg = [SKSpriteNode spriteNodeWithImageNamed:@"start.png"];
    
    startBg.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    startBg.size = CGSizeMake(startBg.frame.size.width, self.frame.size.height);
    [self addChild: startBg];

    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    SKTransition *transition = [SKTransition fadeWithDuration: 0.5];
    
    Level0 *level0 = [[Level0 alloc] initWithSize:CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    
    [self.view presentScene:level0 transition:transition];
    
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
