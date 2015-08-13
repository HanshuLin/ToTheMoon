//
//  Level1.m
//  toTheMoon
//
//  Created by LinHanshu on 6/23/15.
//  Copyright (c) 2015 LinHanshu. All rights reserved.
//

#import "Level1.h"

@implementation Level1

-(void)setUpHero{
    
    _hero = [SKSpriteNode spriteNodeWithImageNamed:@"Hero"];
    _hero.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame) - 200);
    _hero.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:
                         CGSizeMake(_hero.texture.size.width, _hero.texture.size.height)];
    _hero.physicsBody.restitution = 0.0;
    _hero.physicsBody.allowsRotation = NO;
    _hero.physicsBody.dynamic = YES;
    //_hero.physicsBody.categoryBitMask = heroCategory; // 3
    
    
    [_gameLayer addChild:_hero];
    
    
    
}

-(void)didMoveToView:(SKView *)view {
    
    /* Setup your scene here */
    self.physicsWorld.gravity = CGVectorMake(0, -10);
    self.physicsWorld.contactDelegate = self;
    
    
    //gameTexture = [SKTextureAtlas atlasNamed:@"toTheMoon"];
    _backgroundLayer = [SKNode node];
    _backgroundLayer.zPosition = -1;
    _gameLayer = [SKNode node];
    _gameLayer.zPosition = 0;
    _foregroundLayer = [SKNode node];
    _foregroundLayer.zPosition = 1;
    
    [self setUpHero];
    
    
    
    SKTexture *bgTexture = [SKTexture textureWithImageNamed:@"level1-bg.png"];
    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithTexture:bgTexture];
    bg.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    [_backgroundLayer addChild:bg];
    
    
    
    
    
    for (int i = 0; i < 24; i++) {
        Tile *tile = [[Tile alloc] initTileWithPosition: (CGFloat)(16.0 + i * 32.0) yPos:16.0];
        [_gameLayer addChild:tile];
    }
    
    for (int i = 0; i < 2; i++) {
        Tile *tile = [[Tile alloc] initTileWithPosition: (CGFloat)(96 + i * 32) yPos:300.0];
        [_gameLayer addChild:tile];
    }
    
    for (int i = 0; i < 2; i++) {
        Tile *tile = [[Tile alloc] initTileWithPosition: (CGFloat)(196 + i * 32) yPos:500.0];
        [_gameLayer addChild:tile];
    }
    for (int i = 0; i < 2; i++) {
        Tile *tile = [[Tile alloc] initTileWithPosition: (CGFloat)(196 + i * 32) yPos:1600.0];
        [_gameLayer addChild:tile];
    }
    
    for (int i = 0; i < 60; i++) {
        Tile *tile = [[Tile alloc] initTileWithPosition: 16.0 yPos:(CGFloat)(100.0 + i * 32.0)];
        [_gameLayer addChild:tile];
        Tile *tile2 = [[Tile alloc] initTileWithPosition: 656.0 yPos:(CGFloat)(100.0 + i * 32.0)];
        [_gameLayer addChild:tile2];
    }
    
    
    
    
    //Add all layers
    //[self addChild:_bgLayer];
    [self addChild:_gameLayer];
    //[self addChild:_gameLayer];
    //[self addChild:_hero];
    
}

@end
