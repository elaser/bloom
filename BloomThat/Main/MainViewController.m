//
//  MainViewController.m
//  BloomThat
//
//  Created by Anderthan Hsieh on 8/30/13.
//  Copyright (c) 2013 Anderthan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 Method: setupFontsAndCustomBehavior
 Parameters: none
 Purpose: Takes images and creates cap insets and loads them. viewDidLoad will call this so that the buttons look nicer than stock buttons
 */

- (void) setupFontsAndCustomBehavior {
    UIImage *orangeButton = [[UIImage imageNamed:@"orangeButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *orangeButtonHighlighted = [[UIImage imageNamed:@"orangeButtonHighlight.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    [self.sendNowButton setBackgroundImage:orangeButton forState:UIControlStateNormal];
    [self.sendNowButton setBackgroundImage:orangeButtonHighlighted forState:UIControlStateHighlighted];
}

@end
