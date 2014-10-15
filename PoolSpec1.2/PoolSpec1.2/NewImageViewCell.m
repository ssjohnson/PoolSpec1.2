//
//  NewImageViewCell.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 3/20/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "NewImageViewCell.h"

@implementation NewImageViewCell

@synthesize IVArray;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        IVArray = [[NSArray alloc] initWithObjects:self.IV1, self.IV2, self.IV3, self.IV4, self.IV5, self.IV6, self.IV7, self.IV8, self.IV9, self.IV10, nil]; 
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
