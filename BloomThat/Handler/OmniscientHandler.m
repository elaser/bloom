//
//  OmniscientHandler.m
//  BloomThat
//
//  Created by Anderthan Hsieh on 9/2/13.
//  Copyright (c) 2013 Anderthan. All rights reserved.
//

#import "OmniscientHandler.h"
#import <Parse/Parse.h>


@implementation OmniscientHandler

static OmniscientHandler * _shared_model_ = nil;
static NSMutableArray *flowerCountArray;


+ (OmniscientHandler *) sharedInstance {
    if (!_shared_model_) {
        _shared_model_ = [[OmniscientHandler alloc] init];
        flowerCountArray = [@[@0, @0, @0, @0, @0, @0] mutableCopy];
    }
    return _shared_model_;
}

- (void) addFlowerToCart: (FLOWER_TYPE) flower {
    NSLog(@"array is %@", flowerCountArray);
    NSNumber *tempFlowerNumber = [flowerCountArray objectAtIndex:flower];
    [flowerCountArray setObject:[NSNumber numberWithInt:tempFlowerNumber.intValue + 1] atIndexedSubscript:flower];
    
    NSLog(@"after adding, array is %@", flowerCountArray);
}

- (int) numberOfFlowersInCart {
    int tempCount = 0;
    for (NSNumber *flowerNumber in flowerCountArray) {
        tempCount += flowerNumber.intValue;
    }
    
    return tempCount;
}

- (id) createPFObjectFromFlowers {
    PFObject *flowerPost = [PFObject objectWithClassName:@"BloomOrder"];
    [flowerPost setObject:[flowerCountArray objectAtIndex:0] forKey:@"num_tulips"];
    [flowerPost setObject:[flowerCountArray objectAtIndex:1] forKey:@"num_summer_mix"];
    [flowerPost setObject:[flowerCountArray objectAtIndex:2] forKey:@"num_sun"];
    [flowerPost setObject:[flowerCountArray objectAtIndex:3] forKey:@"num_dahlias"];
    [flowerPost setObject:[flowerCountArray objectAtIndex:4] forKey:@"num_market_selection"];
    [flowerPost setObject:[flowerCountArray objectAtIndex:5] forKey:@"num_succulents"];
    
    return flowerPost;
}

- (void) clearFlowerCountArray {
    flowerCountArray = [@[@0, @0, @0, @0, @0, @0] mutableCopy];
}




@end
