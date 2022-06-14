//
//  HBNetworkManager.m
//  Pods
//
//  Created by BingYan on 2021/8/31.
//

#import "HBNetworkManager.h"
#import "HBNetworkConfig.h"

#if __has_include(<YTKNetwork/YTKNetworkConfig.h>)
#import <YTKNetwork/YTKNetworkConfig.h>
#else
#import "YTKNetworkConfig.h"
#endif

@interface HBNetworkManager ()

@property (nonatomic, weak, readwrite) id <HBNetworkHandleDelegate> handleDelegate;

@end

@implementation HBNetworkManager

+ (instancetype)sharedManager {
    static HBNetworkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [HBNetworkManager new];
    });
    return manager;
}

- (void)addConfig:(HBNetworkConfig *)config {
    YTKNetworkConfig *ytkConfig = [YTKNetworkConfig sharedConfig];
    ytkConfig.baseUrl = config.baseUrl;
    if (config.securityPolicy) {
        ytkConfig.securityPolicy = config.securityPolicy;
    }
}

- (void)configHandleDelegate:(id <HBNetworkHandleDelegate>)delegate {
    _handleDelegate = delegate;
}

@end
