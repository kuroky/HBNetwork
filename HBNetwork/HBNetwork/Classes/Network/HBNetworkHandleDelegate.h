//
//  HBNetworkHandleDelegate.h
//  Pods
//
//  Created by BingYan on 2021/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HBNetworkResponse;
@class HBNetworkRequest;

/**
 networkDelegate
 */
@protocol HBNetworkHandleDelegate <NSObject>

@required;
/**
 业务逻辑处理

 @param request 请求request
 */
- (HBNetworkResponse *)handleRequest:(HBNetworkRequest *)request;

/**
 请求headers

 @return @{}
 */
- (NSDictionary <NSString *, NSString *> *)requireHeaders;

@end

NS_ASSUME_NONNULL_END
