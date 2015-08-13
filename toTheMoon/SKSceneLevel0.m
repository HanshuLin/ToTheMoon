//
//  SKScene+Level0.m
//  toTheMoon
//
//  Created by LinHanshu on 6/4/15.
//  Copyright (c) 2015 LinHanshu. All rights reserved.
//

#import "SKSceneLevel0.h"

@implementation SKScene (Level0)


-(void)didMoveToView:(SKView *)view {
    
    
    /* Setup your scene here */
    
    
    
    
    self.physicsWorld.gravity = CGVectorMake(0, -10);
    
    hero = [SKSpriteNode spriteNodeWithImageNamed:@"Bricks"];
     
     hero.xScale = 1;
     hero.yScale = 1;
     hero.position = CGPointMake(CGRectGetMidX(self.frame),
     CGRectGetMidY(self.frame) - 150);
     hero.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(hero.texture.size.width, hero.texture.size.height)];
     hero.physicsBody.restitution = 0.0;
     hero.physicsBody.allowsRotation = NO;
     hero.physicsBody.dynamic = false;
     
     [self addChild:hero];
     
     SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial Bold"];
     
     myLabel.text = @"To the moon";
     myLabel.fontSize = 40;
     myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
     CGRectGetMidY(self.frame) + 100);
     
     [self addChild:myLabel];*/
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Bricks"];
        
        sprite.xScale = 1;
        sprite.yScale = 1;
        sprite.position = location;
        sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(sprite.texture.size.width, sprite.texture.size.height)];
        sprite.physicsBody.dynamic = false;
        sprite.physicsBody.restitution = 0.0;
        
        
        sprite.physicsBody.dynamic = true;
        sprite.physicsBody.velocity = CGVectorMake(0, 30);
        
        //SKAction *action = [SKAction moveBy:CGVectorMake(0, 300) duration:1];
        
        //[hero runAction:[SKAction repeatAction:action count:1]];
        
        [self addChild:sprite];
    }
    
}

@end
