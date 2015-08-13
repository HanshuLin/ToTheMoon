//
//  GameScene.h
//  toTheMoon
//

//  Copyright (c) 2015 LinHanshu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Level0.h"

@interface GameScene : SKScene

{
    //We can also define class members/iVars that are of type private
    //This means they can only be accessed by the member functions
    //of the class defining them and not subclasses
    @private
    int yob;
    
    
    //We can also define class members/iVars that are of type public
    //Public members can be accessed directly
    @public
    SKSpriteNode *hero;
    
    
    //By default class members/iVars are of type protected
    //This means they can only be accessed by a class's own
    //member functions and subclasses of the class and typically
    //also by friend functions of the class and the subclass
    //We can explicitly define members to be protected using the
    //@protected keyword
    
}

@end
