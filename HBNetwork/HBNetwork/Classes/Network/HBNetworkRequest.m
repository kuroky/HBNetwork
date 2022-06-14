//
//  HBNetworkRequest.m
//  Pods
//
//  Created by BingYan on 2021/8/31.
//

#import "HBNetworkRequest.h"
#import "HBNetworkManager.h"
#import "HBNetworkResponse.h"

@interface HBNetworkRequest ()

@property (nonatomic, weak) id <HBNetworkHandleDelegate> handleDelegate;
@property (nonatomic, assign, readwrite) CFTimeInterval startInterval;
@property (nonatomic, assign, readwrite) CFTimeInterval endInterval;

@end

@implementation HBNetworkRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

// 设置业务代理
- (void)setup {
    self.handleDelegate = [HBNetworkManager sharedManager].handleDelegate;
}

// 默认超时时间
- (NSTimeInterval)requestTimeoutInterval {
    return 15;
}

// 默认请求方法 POST
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

// 默认请求为JSON格式
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (NSString *)baseUrl {
    return [YTKNetworkConfig sharedConfig].baseUrl;
}

- (void)hb_requestWithCompletion:(void (^)(HBNetworkResponse *response))completion {
    self.startInterval = CACurrentMediaTime();
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        self.endInterval = CACurrentMediaTime();
        HBNetworkResponse *response = nil;
        if (self.handleDelegate) {
            response = [self.handleDelegate handleRequest:request];
        }
        completion ? completion(response) : nil;
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        self.endInterval = CACurrentMediaTime();
        HBNetworkResponse *response = nil;
        if (self.handleDelegate) {
            response = [self.handleDelegate handleRequest:request];
        }
        completion ? completion(response) : nil;
    }];
}

// headers添加
- (NSDictionary *)requestHeaderFieldValueDictionary {
    if (_requestHeaders) {
        return _requestHeaders;
    }
    
    if (self.handleDelegate.requireHeaders) {
        _requestHeaders = self.handleDelegate.requireHeaders;
    }
    
    return _requestHeaders;
}

@end
