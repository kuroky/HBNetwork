//
//  HBNetworkManager.h
//  Pods
//
//  Created by BingYan on 2021/8/31.
//

#import <Foundation/Foundation.h>
#import "HBNetworkHandleDelegate.h"

@class HBNetworkConfig;

NS_ASSUME_NONNULL_BEGIN

/// 网络层管理类
@interface HBNetworkManager : NSObject

/// 单例
+ (instancetype)sharedManager;

/// 加载配置
/// @param config 配置
- (void)addConfig:(HBNetworkConfig *)config;

/// 设置代理对象 (为单例)
/// @param delegate delegate对象
- (void)configHandleDelegate:(id <HBNetworkHandleDelegate>)delegate;

/// 代理对象
@property (nonatomic, weak, readonly) id <HBNetworkHandleDelegate> handleDelegate;

@end

NS_ASSUME_NONNULL_END
