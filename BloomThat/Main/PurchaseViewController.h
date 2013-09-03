//
//  PurchaseViewController.h
//  BloomThat
//
//  Created by Anderthan Hsieh on 8/30/13.
//  Copyright (c) 2013 Anderthan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchaseModalViewController.h"
#import "BloomViewController.h"

@interface PurchaseViewController : BloomViewController <UITableViewDataSource, UITableViewDelegate, FlowerModalProtocol>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;
@property (weak, nonatomic) IBOutlet UITableView *flowerTableView;

@property PurchaseModalViewController *purchaseModalVC;

@end

@interface FlowerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *flowerImageView;
@property (weak, nonatomic) IBOutlet UILabel *flowerTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
