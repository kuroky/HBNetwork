//
//  HBNetworkResponse.h
//  HBNetwork
//
//  Created by BingYan on 2021/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBNetworkResponse : NSObject

///  请求状态 成功或失败
@property (nonatomic, assign) BOOL isSuccess;

/// 返回码状态码
@property (nonatomic, assign) NSInteger errCode;

/// 报错信息
@property (nonatomic, copy) NSString *errMsg;

/// 业务数据 Dic/Arr
@property (nonatomic, strong) id respData;

@end

NS_ASSUME_NONNULL_END
