//
//  TweetViewController.m
//  BloomThat
//
//  Created by Anderthan Hsieh on 9/2/13.
//  Copyright (c) 2013 Anderthan. All rights reserved.
//

#import "TweetViewController.h"


@interface TweetViewController () {

}

@end

@implementation TweetViewController

@synthesize webView;

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

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://twitter.com/BloomThat"]];
    [webView loadRequest:request];

}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
