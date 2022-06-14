//
//  HBNetworkhandle.h
//  HBNetwork-iOS
//
//  Created by BingYan on 2021/8/31.
//

#import <Foundation/Foundation.h>
#import <HBNetwork/HBNetworkHandleDelegate.h>

NS_ASSUME_NONNULL_BEGIN

/**
 基于业务层的统一处理
 1. Http header 传参
 2. Reponse 解析
 3. 异常code处理
 4. log打印
 */
@interface HBNetworkhandle : NSObject <HBNetworkHandleDelegate>

+ (instancetype)handler;

@end

NS_ASSUME_NONNULL_END
