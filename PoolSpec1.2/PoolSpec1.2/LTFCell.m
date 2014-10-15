//
//  LTFCell.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/4/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "LTFCell.h"

@implementation LTFCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
