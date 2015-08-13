//
//  Level1.h
//  toTheMoon
//
//  Created by LinHanshu on 6/23/15.
//  Copyright (c) 2015 LinHanshu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


@interface Hero : SKSpriteNode{
@public
    int status;
    //CGFloat SPEED;
}
-(id)initTileWithPosition:(CGFloat)x yPos:(CGFloat)y;
@end



@interface Tile : SKSpriteNode{
    
}
-(id)initTileWithPosition:(CGFloat)x yPos:(CGFloat)y;

@end


@interface Level1 : SKScene{
    CGRect screenRect;
    CGFloat screenHeight;
    CGFloat screenWidth;
    
    
}
@property Hero *hero;
@property SKNode *backgroundLayer;
@property SKNode *foregroundLayer;
@property SKNode *gameLayer;

@end
