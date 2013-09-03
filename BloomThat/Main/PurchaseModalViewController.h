//
//  PurchaseModalViewController.h
//  BloomThat
//
//  Created by Anderthan Hsieh on 8/30/13.
//  Copyright (c) 2013 Anderthan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BloomViewController.h"

@protocol FlowerModalProtocol <NSObject>

- (void) flowerSelected: (FLOWER_TYPE) flower;

@end

@interface PurchaseModalViewController : BloomViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flowerImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property FLOWER_TYPE flowerTypeToDisplay;

@property (weak, nonatomic) id <FlowerModalProtocol> flowerDelegate;

@end
