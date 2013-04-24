SupersonicAdsPhoneGapPlagin
===========================

SupersonicAds plugin for ios.


----------------------------------------------------------------------------------------------------

Configurations:
1. Get the supersonicads sdk and extract.

2. Drag the SSASDKlibs to your project.

3. Drag the plugin files to your plugins folder. (SupersonicAdsPlugin.h and SupersonicAdsPlugin.m)

4. Drag the plugin js file into you www folder.

5. SupersonicAdsPlugin.m set your app key in this line: NSString* APPKEY = @"here_set__the_app_key";
6
6. That it.

----------------------------------------------------------------------------------------------------

SupersonicAdsPlugin.js
----------------------------------------------------------------------------------------------------


 initBrandConnect: function (userid, success, fail)
 showBrandConnect: function (success, fail) 
 showOfferWall: function (userid, success, fail)
 
 callbacks:
 ---------------------------------------------------------------------------------------------------
    // function()
    onBrandConnectDidInitWithCampaignInfo: null,
    // function()
    onBrandConnectDidFailInitWithError: null,
    // function()
    onBrandConnectWindowWillOpen: null,
    // function() 
    onBrandConnectWindowDidClose: null,
    // function()
    onBrandConnectDidFinishAd: null,
    // function()
    onBrandConnectNoMoreOffers: null,
    // function()
    onOfferWallClosed: null,
