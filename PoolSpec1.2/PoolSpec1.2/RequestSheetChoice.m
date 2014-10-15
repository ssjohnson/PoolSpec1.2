//
//  RequestSheetChoice.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 3/19/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "RequestSheetChoice.h"

@interface RequestSheetChoice ()

@end

@implementation RequestSheetChoice

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.scrollView.contentSize=CGSizeMake(280.0, 450.0);
    self.scrollView.canCancelContentTouches = NO;
    self.scrollView.delaysContentTouches = NO;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
