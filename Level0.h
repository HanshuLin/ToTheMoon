//
//  Level0.h
//  toTheMoon
//
//  Created by LinHanshu on 6/4/15.
//  Copyright (c) 2015 LinHanshu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>
#import "Level1.h"
//#import "SpriteStruct.h"



@interface Level0 : SKScene
{
    CGRect screenRect;
    CGFloat screenHeight;
    CGFloat screenWidth;
}
@property Hero *hero;
@property SKNode *backgroundLayer;
@property SKNode *foregroundLayer;
@property SKNode *gameLayer;

@end

