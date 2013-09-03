//
//  OmniscientHandler.h
//  BloomThat
//
//  Created by Anderthan Hsieh on 9/2/13.
//  Copyright (c) 2013 Anderthan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    FLOWER_TULIP,
    FLOWER_SUMMER_MIX,
    FLOWER_HERE_COMES_THE_SUN,
    FLOWER_DAHLIAS,
    FLOWER_MARKET_SELECTION,
    FLOWER_SUCCULENTS
}FLOWER_TYPE;

@interface OmniscientHandler : NSObject

+ (OmniscientHandler *) sharedInstance;

- (void) addFlowerToCart: (FLOWER_TYPE) flower;
- (int) numberOfFlowersInCart;
- (id) createPFObjectFromFlowers;
- (void) clearFlowerCountArray;


@end
