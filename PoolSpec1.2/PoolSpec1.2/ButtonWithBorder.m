//
//  ButtonWithBorder.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 10/14/14.
//  Copyright (c) 2014 Sean Johnson. All rights reserved.
//

#import "ButtonWithBorder.h"
#import <QuartzCore/QuartzCore.h>

@implementation ButtonWithBorder

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)init {
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 10;
}

@end
