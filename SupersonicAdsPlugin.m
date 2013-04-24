//
//  SupersonicAdsPlugin.h
//
//
//  Created by meir amar on 13-04-02.
//  Copyright 2013 meir amar. All rights reserved.
//


#import "SupersonicAdsPlugin.h"
#import "SupersonicAdsPublisher.h"


// Help create NSNull objects for nil items (since neither NSArray nor NSDictionary can store nil values).
#define NILABLE(obj) ((obj) != nil ? (NSObject *)(obj) : (NSObject *)[NSNull null])

// To avoid compilation warning, declare JSONKit and SBJson's
// category methods without including their header files.
@interface NSArray (StubsForSerializers)
- (NSString *)cdvjk_JSONString;
- (NSString *)cdvjk_JSONRepresentation;
@end

// Helper category method to choose which JSON serializer to use.
@interface NSArray (cdvjk_JSONSerialize)
- (NSString *)cdvjk_JSONSerialize;
@end

@implementation NSArray (cdvjk_JSONSerialize)
- (NSString *)cdvjk_JSONSerialize {
    return [self respondsToSelector:@selector(cdvjk_JSONString)] ? [self cdvjk_JSONString] : [self cdvjk_JSONRepresentation];
}
@end


@implementation SupersonicAdsPlugin

NSString* APPKEY = @"here_set__the_app_key";

// videos methods

- (void) initBrandConnect:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    
    NSString* callbackId = [arguments pop];
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    @try {
        NSString* userid = [arguments objectAtIndex:0];
        
        NSLog(@"SupersonicAdsPlugin init with userid: %@)", userid);
        
        if (userid != nil) {
            //NSDictionary* dic = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: @"1", nil]
            //                                                forKeys:[NSArray arrayWithObjects: @"demoCampaigns",nil]];
            
            SupersonicAdsPublisher* publisher = [SupersonicAdsPublisher sharedSupersonicAds];
            [publisher initBrandConnectWithApplicationKey:APPKEY userId:userid delegate:self additionalParameters:nil];
            
            
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            javaScript = [pluginResult toSuccessCallbackString:callbackId];
        }
    } @catch (id exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:callbackId];
    }
    
    [self writeJavascript:javaScript];
}


- (void) showBrandConnect:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{    
    NSLog(@"showBrandConnect init with userid");
 
    NSString* callbackId = [arguments pop];
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    @try {
              
        SupersonicAdsPublisher* publisher = [SupersonicAdsPublisher sharedSupersonicAds];
        [publisher showBrandConnect:self.viewController];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:callbackId];
        
    } @catch (id exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:callbackId];
    }
    
    [self writeJavascript:javaScript];
}



/* The following method will be called on a successful initialization.
* The campaignInfo Dictionary contains the following key-value pairs: * - numberAvailableCampaigns - integer
* - totalNumberCredits - integer
* - firstCampaignCredits - integer
* In case we don’t have campaigns, numberAvailableCampaigns will be 0.
* Otherwise we do have campaigns hence the incentivized button should be * displayed to the user
*/
- (void)brandConnectDidInitWithCampaignInfo:(NSDictionary *)campaignInfo
{       
     NSString* resultString = [[NSDictionary dictionaryWithObjectsAndKeys:
                               @"brandConnectDidInitWithCampaignInfo", @"eventName",
                               NILABLE(campaignInfo), @"data",
                               nil] cdvjk_JSONString];
    
     NSString *js = [NSString stringWithFormat:@"SupersonicAdsPlugin._handleEvents(%@)", resultString];
     NSLog(@"SupersonicAdsPlugin js: %@", js);
     [self writeJavascript: js];

}
/*
* The following method will be called when the server initialization * failed.
* The error Dictionary contains the following key-value pairs:
* - errorNumber - integer (optional)
* - description - string
*/
- (void)brandConnectDidFailInitWithError:(NSDictionary *)error
{
    
    NSString* resultString = [[NSDictionary dictionaryWithObjectsAndKeys:
                               @"brandConnectDidFailInitWithError", @"eventName",
                               NILABLE(error), @"data",
                               nil] cdvjk_JSONString];
    
    
    NSString *js = [NSString stringWithFormat:@"SupersonicAdsPlugin._handleEvents(%@)", resultString];
    NSLog(@"SupersonicAdsPlugin js: %@", js);
    [self writeJavascript: js];

}
/*
* Called before the webView is shown.
*/
- (void)brandConnectWindowWillOpen
{
    
    NSString* resultString = [[NSDictionary dictionaryWithObjectsAndKeys:
                               @"brandConnectWindowWillOpen", @"eventName",
                               NILABLE(nil), @"data",
                               nil] cdvjk_JSONString];
    
    NSString *js = [NSString stringWithFormat:@"SupersonicAdsPlugin._handleEvents(%@)", resultString];
    NSLog(@"SupersonicAdsPlugin js: %@", js);
    [self writeJavascript: js];

}
/*
* Called before the webView is closed.
*/
- (void)brandConnectWindowDidClose
{
    
    NSString* resultString = [[NSDictionary dictionaryWithObjectsAndKeys:
                               @"brandConnectWindowDidClose", @"eventName",
                               NILABLE(nil), @"data",
                               nil] cdvjk_JSONString];
    
    NSString *js = [NSString stringWithFormat:@"SupersonicAdsPlugin._handleEvents(%@)", resultString];
    
    NSLog(@"SupersonicAdsPlugin js: %@", js);
    [self writeJavascript: js];
}
/* Called once a user successfully completes a BrandConnect offer, and earns * credits.
* The campaignInfo Dictionary contains the following key-value pair:
* - credits – integer
*/
- (void)brandConnectDidFinishAd:(NSDictionary *)campaignInfo
{
    NSString* resultString = [[NSDictionary dictionaryWithObjectsAndKeys:
                               @"brandConnectDidFinishAd", @"eventName",
                               NILABLE(campaignInfo), @"data",
                               nil] cdvjk_JSONString];
    
    NSString *js = [NSString stringWithFormat:@"SupersonicAdsPlugin._handleEvents(%@)", resultString];
    
    NSLog(@"SupersonicAdsPlugin js: %@", js);
    [self writeJavascript: js];
}
/*
* Called when the last offer was completed by the user in the current
* session, and indicates that there are currently no more available offers * for the user.
* Following this event, the app can call
* initBrandConnectWithApplicationKey() occasionally to check for * availability of new offers.
*/
- (void)brandConnectNoMoreOffers
{
    NSString* resultString = [[NSDictionary dictionaryWithObjectsAndKeys:
                               @"brandConnectNoMoreOffers", @"eventName",
                               NILABLE(nil), @"data",
                               nil] cdvjk_JSONString];
    
    NSString *js = [NSString stringWithFormat:@"SupersonicAdsPlugin._handleEvents(%@)", resultString];
    
    NSLog(@"SupersonicAdsPlugin js: %@", js);
    [self writeJavascript: js];

}




// offerwall methods

- (void) showOfferWall:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    NSString* callbackId = [arguments pop];
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    @try {
        NSString* userid = [arguments objectAtIndex:0];
        
        NSLog(@"SupersonicAdsPlugin showOfferWallt userid: %@)", userid);
        
        if (userid != nil) {
            
            SupersonicAdsPublisher* publisher = [SupersonicAdsPublisher sharedSupersonicAds];
            [publisher showOfferWallWithApplicationKey:APPKEY userId:userid delegate:self shouldGetLocation:NO extraParameters:NULL parentView: self.viewController];
            
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            javaScript = [pluginResult toSuccessCallbackString:callbackId];
        }
    } @catch (id exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:callbackId];
    }
    
    [self writeJavascript:javaScript];
}


- (void) offerWallDidClose
{

    NSLog(@"SupersonicAdsPlugin offerWallDidClose");
    
    NSString* resultString = [[NSDictionary dictionaryWithObjectsAndKeys:
                               @"offerWallDidClose", @"eventName",
                               NILABLE(nil), @"data",
                               nil] cdvjk_JSONString];
    
    NSString *js = [NSString stringWithFormat:@"SupersonicAdsPlugin._handleEvents(%@)", resultString];

    NSLog(@"SupersonicAdsPlugin js: %@", js);
    [self writeJavascript: js];
    
}


// end of offerwall methods

@end
