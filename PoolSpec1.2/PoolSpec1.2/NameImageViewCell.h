//
//  NameImageViewCell.h
//  PoolSpec1.2
//
//  Created by Sean Johnson on 3/27/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomTextField;

@interface NameImageViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet CustomTextField *ImageName;
@property (strong, nonatomic) IBOutlet UIImageView *Picture;
@end
