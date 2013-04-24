//
//  SupersonicAdsPlugin.h
//  
//
//  Created by meir amar on 13-04-02.
//  Copyright 2013 meir amar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CORDOVA/CDVPlugin.h>
#import "SupersonicAdsPlugin.h"
#import "SupersonicAdsPublisher.h"

@interface SupersonicAdsPlugin : CDVPlugin {
}

- (void) initBrandConnect:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void) showBrandConnect:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void) showOfferWall:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;


@end
