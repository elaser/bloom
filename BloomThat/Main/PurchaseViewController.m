//
//  PurchaseViewController.m
//  BloomThat
//
//  Created by Anderthan Hsieh on 8/30/13.
//  Copyright (c) 2013 Anderthan. All rights reserved.
//

#import "PurchaseViewController.h"
#import <Parse/Parse.h>



@interface PurchaseViewController () {
    NSArray *flowerArray;
    NSArray *flowerPictureArray;
    NSArray *flowerPriceArray;
}

@end

@implementation PurchaseViewController

@synthesize flowerTableView, scrollView, greetingLabel, purchaseModalVC;

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
    
    UIBarButtonItem *cartButton = [[UIBarButtonItem alloc] initWithTitle:@"0" style:UIBarButtonItemStylePlain target:self action:@selector(clickMyShoppingCart)];
    self.tabBarController.navigationItem.rightBarButtonItem = cartButton;

    
    flowerArray = @[@"Tulips", @"Summer Mix", @"Here Comes The Sun", @"Dahlias", @"Florist's Market Selection", @"Succulents"];
    flowerPictureArray = @[@"bloomthat_tulips_2x_large.png", @"bloomthat_summermix_2x_large.png", @"bloomthat_sunflowers_2x_large.png", @"bloomthat_dahlia_2x_large.png", @"bloomthat_awesome_3_2x_large.png", @"bloomthat_succulent_2x_large.png"];
    flowerPriceArray = @[@"35", @"35", @"40", @"38", @"45", @"25"];
    self.purchaseModalVC = (PurchaseModalViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"purchaseModalVC"];

}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBarHidden = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) clickMyShoppingCart {
    if ([[OmniscientHandler sharedInstance] numberOfFlowersInCart] <= 0) {
        UIAlertView *noFlowerAlertView = [[UIAlertView alloc] initWithTitle:@"No flowers!" message:@"You don't have any flowers in your cart!" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [noFlowerAlertView show];
    }
    else {
        PFObject *pfToPost = (PFObject *)[[OmniscientHandler sharedInstance] createPFObjectFromFlowers];
        BOOL saveSuccess = [pfToPost save];
        
        UIAlertView *resultAlertView;
        if (saveSuccess) {
            resultAlertView = [[UIAlertView alloc] initWithTitle:@"Order Created!" message:@"Flowers en route!" delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles: nil];
            [[OmniscientHandler sharedInstance] clearFlowerCountArray];
            [self.tabBarController.navigationItem.rightBarButtonItem setTitle:@"0"];
            
        }
        else
            resultAlertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Order cannot be created at this time" delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles: nil];
        [resultAlertView show];

    }
}

/*
 Start of UITableViewDelegate and UITableViewSource
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return flowerArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FlowerTableViewCell *flowerCell = (FlowerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"flower_cell"];
    if (!flowerCell) {
        flowerCell = [[FlowerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"flower_cell"];
    }
    
    flowerCell.flowerTitleLabel.text = [flowerArray objectAtIndex:indexPath.row];
    flowerCell.flowerImageView.image = [UIImage imageNamed:[flowerPictureArray objectAtIndex:indexPath.row]];
    flowerCell.priceLabel.text = [NSString stringWithFormat:@"$%@", [flowerPriceArray objectAtIndex:indexPath.row]];
    
    flowerCell.flowerTitleLabel.font = [UIFont fontWithName:@"Helvetica-Condensed" size:14];
    flowerCell.priceLabel.font = [UIFont fontWithName:@"Helvetica-Condensed" size:14];
    
    return flowerCell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    purchaseModalVC.flowerDelegate = self;
    purchaseModalVC.flowerTypeToDisplay = indexPath.row;
    [self presentViewController:purchaseModalVC animated:YES completion:^{
        purchaseModalVC.titleLabel.text = [NSString stringWithFormat:@"%@ ($%@)", [flowerArray objectAtIndex:indexPath.row], [flowerPriceArray objectAtIndex:indexPath.row]];
        purchaseModalVC.flowerImageView.image = [UIImage imageNamed:[flowerPictureArray objectAtIndex:indexPath.row]];
        purchaseModalVC.descriptionLabel.text = [self obtainTextForFlowerDescription:indexPath];
    }];
}

/*
 Method: obtainTextForFlowerDescription
 Parameters: none
 Purpose: Returns description for a flower

 */
- (NSString *) obtainTextForFlowerDescription: (NSIndexPath *) indexPath {
    switch (indexPath.row) {
        case FLOWER_TULIP:
            return @"Widely recognized throughout the world as one of the most happiness inducing flowers, these 15 beautiful long stemmed tulips are sure to brighten anyone's day!";
            break;
        case FLOWER_SUMMER_MIX:
            return @"Summer is in the air and it's time to add a little color to our lives. We think our mix is a perfect compliment.  Our Summer Mix features an assortment of blooms and sprigs to add a spring to your step and is sure to brighten anyone's day. ";
            break;
        case FLOWER_HERE_COMES_THE_SUN:
            return @"The official flower of Summer. Nothing says 'sun's out, fun's out' like a big bouquet of Sunflowers.  Bold and bursting with warmth, this summer favorite features fresh California Sunflowers accented by a variety of other seasonal gems like veronica.";
            break;
        case FLOWER_DAHLIAS:
            return @"The official flower of San Francisco.  Infinite in variety of color and form, it’s the very symbol of San Francisco life and of the spirit of her people. Versatile and vibrant but lasting a short while (3-5 day vase life), these dahlias are sure to impress.";
            break;
        case FLOWER_MARKET_SELECTION:
            return @"Who doesn't love fresh?  For those who love the thrill of a great surprise, put your trust in us. We'll take great care of you with a selection of our freshest blooms of the day, wrapped in burlap.";
            break;
        case FLOWER_SUCCULENTS:
            return @"Beautiful, living and low maintenance. Stir up a case of desk envy with these lovely succulents. Planted in a minimalist square pot, send a little slice of zen to a friend's den, desk or office.";
            break;
        default:
            return @"";
            break;
    }
}

- (void) setupFontsAndCustomBehavior {
    self.greetingLabel.font = [UIFont fontWithName:@"Helvetica-Condensed" size:16];
}

/*
 Method: flowerSelected
 Parameters: none
 Purpose: delegate method for when user actually adds flower to cart
 */

- (void) flowerSelected:(FLOWER_TYPE)flower {
    [[OmniscientHandler sharedInstance] addFlowerToCart:flower];
    
    self.tabBarController.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"%d", [[OmniscientHandler sharedInstance] numberOfFlowersInCart]];
}

@end


@implementation FlowerTableViewCell

@synthesize flowerImageView, flowerTitleLabel, priceLabel, descriptionLabel;

@end
