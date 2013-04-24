var SupersonicAdsPlugin = {
    initBrandConnect: function (userid, success, fail) {
        return cordova && cordova.exec(success, fail, "SupersonicAdsPlugin", "initBrandConnect", [userid]);
    },
    showBrandConnect: function (success, fail) {
        return cordova && cordova.exec(success, fail, "SupersonicAdsPlugin", "showBrandConnect",[]);
    },
    showOfferWall: function (userid, success, fail) {
        return cordova && cordova.exec(success, fail, "SupersonicAdsPlugin", "showOfferWall", [userid]);
    },
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
    //////////////////////////////////////////////////
    /////////// called from plugin ///////////////////
    _handleEvents: function (resultObj) {
        console.log('SupersonicAdsPlugin JS - ' + resultObj.eventName + ' triggered.');
        switch (resultObj.eventName) {
            case 'brandConnectDidInitWithCampaignInfo':
                if (typeof this.onBrandConnectDidInitWithCampaignInfo === 'function')
                    this.onBrandConnectDidInitWithCampaignInfo(resultObj.data);
                break;
            case 'brandConnectDidFailInitWithError':
                if (typeof this.onBrandConnectDidFailInitWithError === 'function')
                    this.onBrandConnectDidFailInitWithError(resultObj.data);
                break;
            case 'brandConnectWindowWillOpen':
                if (typeof this.onBrandConnectWindowWillOpen === 'function')
                    this.onBrandConnectWindowWillOpen();
                break;
            case 'brandConnectWindowDidClose':
                if (typeof this.onBrandConnectWindowDidClose === 'function')
                    this.onBrandConnectWindowDidClose();
                break;
            case 'brandConnectDidFinishAd':
                if (typeof this.onBrandConnectDidFinishAd === 'function')
                    this.onBrandConnectDidFinishAd(resultObj.data);
                break;
            case 'brandConnectNoMoreOffers':
                if (typeof this.onBrandConnectNoMoreOffers === 'function')
                    this.onBrandConnectNoMoreOffers();
                break;
            case 'offerWallDidClose':
                if (typeof this.onOfferWallClosed === 'function')
                    this.onOfferWallClosed();
                break;
        }
    }

};
