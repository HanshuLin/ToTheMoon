//
//  Level0.m
//  toTheMoon
//
//  Created by LinHanshu on 6/4/15.
//  Copyright (c) 2015 LinHanshu. All rights reserved.
//

#import "Level0.h"

static const uint32_t heroCategory     =  0x1 << 0;
static const uint32_t monsterCategory        =  0x1 << 1;

@implementation Tile

-(id)initTileWithPosition:(CGFloat)x yPos:(CGFloat)y{
    
    self = [super init];
    
    if (self!=nil) {
        
        self = [SKSpriteNode spriteNodeWithImageNamed:@"Bricks"];
        //self.texture = [SKTexture textureWithImageNamed:@"Bricks"];
        self.position = CGPointMake(x,y);
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:
                            CGSizeMake(self.texture.size.width, self.texture.size.height)];
        self.physicsBody.dynamic = NO;
        self.physicsBody.restitution = 0.0;
        
    }
    return self;
}


@end

@implementation Level0{
    SKTextureAtlas *gameTexture;
    SKAction *chase;
    SKSpriteNode *enemy;
    BOOL complete;
}

-(void)setUpHero{
    
    _hero = [SKSpriteNode spriteNodeWithImageNamed:@"Hero"];
    _hero.position = CGPointMake(CGRectGetMidX(self.frame),
                                 CGRectGetMidY(self.frame) - 200);
    _hero.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:
                         CGSizeMake(_hero.texture.size.width, _hero.texture.size.height)];
    _hero.physicsBody.restitution = 0.0;
    _hero.physicsBody.allowsRotation = NO;
    _hero.physicsBody.dynamic = YES;
    _hero.physicsBody.categoryBitMask = heroCategory; // 3
    
    
    [_gameLayer addChild:_hero];

    
    
}

-(void)didMoveToView:(SKView *)view {
    
    /* Setup your scene here */
    self.physicsWorld.gravity = CGVectorMake(0, -10);
    self.physicsWorld.contactDelegate = self;
    
    complete = NO;
    
    gameTexture = [SKTextureAtlas atlasNamed:@"toTheMoon"];
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
    
    enemy = [SKSpriteNode spriteNodeWithImageNamed:@"spriteChase"];
    enemy.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:
                         CGSizeMake(_hero.texture.size.width, _hero.texture.size.height)];
    enemy.physicsBody.dynamic = NO;
    enemy.position = CGPointMake(300.0f, 300.0f);
    enemy.physicsBody.categoryBitMask = monsterCategory; // 3
    enemy.physicsBody.contactTestBitMask = heroCategory; // 4
    //chase = [SKAction moveTo:_hero.position duration: 8];
    //[enemy runAction: chase];

    //enemy.physicsBody.collisionBitMask = 0; // 5
    [_gameLayer addChild:enemy];
    
    
    
    
    //Add all layers
    //[self addChild:_bgLayer];
    [self addChild:_gameLayer];
    //[self addChild:_gameLayer];
    //[self addChild:_hero];

    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        _hero.physicsBody.velocity = CGVectorMake(0.0f, 0.0f);
        _hero.speed = 13.0f;
        CGFloat impulseY = 27.0f;
        
        CGPoint gameLocation = CGPointMake(location.x - _gameLayer.position.x, location.y);
        
        CGFloat distance = gameLocation.x - _hero.position.x;
        
        SKAction *move = [SKAction moveToX:gameLocation.x duration: fabs(distance/_hero.speed)];
        [_hero.physicsBody applyImpulse:CGVectorMake(0.0f, impulseY) atPoint:_hero.position];
        [_hero removeAllActions];
        [_hero runAction: move];
        
    }
    
}


-(void)didBeginContact:(SKPhysicsContact *) contact{
    
    [_hero removeFromParent];
    [self setUpHero];
    
    
}

-(void)processUserMotionForUpdate:(NSTimeInterval)currentTime {


}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    //NSLog(@"%f",_hero.position.y);
    if(!complete){
        if(_hero.position.y > 2400.0f){
            
            complete = YES;
            SKTransition *transition = [SKTransition fadeWithDuration: 0.5];
            
            Level1 *level1 = [[Level1 alloc] initWithSize:CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
            
            [self.view presentScene:level1 transition:transition];
        }
    }
    
    
    CGPoint pos = enemy.position;
    pos.y += 1;
    //pos.x += 1;
    
    enemy.position = pos;
    
    if (_hero.position.y > 300.0f) {
        if(_hero.position.y > 2000.0f){
            _gameLayer.position = CGPointMake(_gameLayer.position.x, -1700.0f);
        }
        else{
            _gameLayer.position = CGPointMake(_gameLayer.position.x, -(_hero.position.y - 300.0f));
        }
       
    }
    
    
    if (_hero.position.x > 200.0f) {
        if(_hero.position.x > 496.0f){
            _gameLayer.position = CGPointMake(-296.0f, _gameLayer.position.y);
        }
        else{
            _gameLayer.position = CGPointMake(-(_hero.position.x - 200.0f), _gameLayer.position.y);
        }
        
    }
    
    if(_hero.physicsBody.velocity.dy < 0){
        _hero.texture = [gameTexture textureNamed:@"fall.png"];
    }
    else if(_hero.physicsBody.velocity.dy > 0){
        _hero.texture = [gameTexture textureNamed:@"jump.png"];
    }
    else{
        _hero.texture = [gameTexture textureNamed:@"stay.png"];
    }
   // NSLog(@"%f", _hero.position.y);
}
@end
