//
//  PurchaseModalViewController.m
//  BloomThat
//
//  Created by Anderthan Hsieh on 8/30/13.
//  Copyright (c) 2013 Anderthan. All rights reserved.
//

#import "PurchaseModalViewController.h"

@interface PurchaseModalViewController ()

@end

@implementation PurchaseModalViewController

@synthesize flowerImageView, titleLabel, descriptionLabel, cancelButton, flowerDelegate, flowerTypeToDisplay;

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
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Condensed-Light-Light" size:24];
    self.descriptionLabel.font = [UIFont fontWithName:@"Helvetica-Condensed-Light-Light" size:16];
    
    UIImage *orangeButton = [[UIImage imageNamed:@"orangeButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *orangeButtonHighlighted = [[UIImage imageNamed:@"orangeButtonHighlight.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    UIImage *grayButton = [[UIImage imageNamed:@"greyButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *grayButtonHighlighted = [[UIImage imageNamed:@"greyButtonHighlight.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    [self.addToCartButton setBackgroundImage:orangeButton forState:UIControlStateNormal];
    [self.addToCartButton setBackgroundImage:orangeButtonHighlighted forState:UIControlStateHighlighted];
    
    [self.cancelButton setBackgroundImage:grayButton forState:UIControlStateNormal];
    [self.cancelButton setBackgroundImage:grayButtonHighlighted forState:UIControlStateHighlighted];
}

- (IBAction)clickAddToCartButton:(id)sender {
    [self.flowerDelegate flowerSelected:flowerTypeToDisplay];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
