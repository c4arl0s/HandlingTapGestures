//
//  ViewController.h
//  SwitchCase_objectiveC
//
//  Created by Carlos Santiago Cruz on 6/29/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PlayerState) {
    playerStateOff = 0,
    playerStatePlaying = 1,
    playerStatePause = 2,
    playerStateNonAvailable = -1,
    playerStateInjured = 3
};

@interface ViewController : UIViewController


@end

