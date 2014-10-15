//
//  LTFCell.h
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/4/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomTextField;

@interface LTFCell : UITableViewCell

@property NSInteger cellTag;
@property (strong, nonatomic) IBOutlet UILabel *cellLabel;
@property (strong, nonatomic) IBOutlet CustomTextField *cellTextField;
@end
