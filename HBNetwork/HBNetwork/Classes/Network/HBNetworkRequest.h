//
//  HBNetworkRequest.h
//  Pods
//
//  Created by BingYan on 2021/8/31.
//

#import <YTKNetwork/YTKNetwork.h>
#import "HBNetworkHandleDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@class HBNetworkResponse;

@interface HBNetworkRequest : YTKRequest

/**
 发起请求

 @param completion response block
 */
- (void)hb_requestWithCompletion:(void (^)(HBNetworkResponse *response))completion;

/// 请求开始
@property (nonatomic, assign, readonly) CFTimeInterval startInterval;

/// 请求结束
@property (nonatomic, assign, readonly) CFTimeInterval endInterval;

/// 请求header
@property (nonatomic, strong, readonly) NSDictionary *requestHeaders;

@end

NS_ASSUME_NONNULL_END
