//
//  HBNetworkhandle.m
//  HBNetwork-iOS
//
//  Created by BingYan on 2021/8/31.
//

#import "HBNetworkhandle.h"
#import <HBNetwork/HBNetworkRequest.h>
#import <HBNetwork/HBNetworkResponse.h>

@interface HBNetworkhandle ()

@end

@implementation HBNetworkhandle

+ (instancetype)handler {
    static dispatch_once_t onceToken;
    static HBNetworkhandle *handler;
    dispatch_once(&onceToken, ^{
        handler = [HBNetworkhandle new];
    });
    return handler;
}

- (NSDictionary <NSString *, NSString *> *)requireHeaders {
    NSDictionary *para = [self headParamters:NO];
    return para;
}

- (NSDictionary *)headParamters:(BOOL)needSession {
    static dispatch_once_t onceToken;
    static NSMutableDictionary *para;
    dispatch_once(&onceToken, ^{
        para = [NSMutableDictionary dictionary];
        //[para setObject:[HBMacro systemLanguageType5] forKey:@"lan"];
        NSString *deviceName = @"";
        [para setObject:deviceName forKey:@"device"];
        [para setObject:@"1" forKey:@"os_type"]; // 1:ios; 2:android
        [para setObject:@"dev" forKey:@"channel"];
        NSString *clientVersion = @"1.0.0";
        [para setObject:clientVersion forKey:@"client_ver"];
        [para setObject:@"ch_cn" forKey:@"os_lan"];
        [para setObject:@"device_id" forKey:@"device_id"];
        [para setObject:@"ios" forKey:@"channel"];
    });
    return para;
}

- (HBNetworkResponse *)handleRequest:(HBNetworkRequest *)request {
    HBNetworkResponse *reponse = [self parseResponse:request.responseData];
    #if DEBUG
    [self printLog:request reponse:reponse];
    #endif
    return reponse;
}

- (HBNetworkResponse *)parseResponse:(NSData *)responseData {
    NSDictionary *dic = @{};
    if (responseData) {
        dic = [NSJSONSerialization JSONObjectWithData:responseData
                                              options:NSJSONReadingAllowFragments
                                                error:nil];
    }
    else {
        dic = @{@"respMsg": @"请求失败,请稍后再试",
                @"respCode": @(408)};
    }
    HBNetworkResponse *reponse = [HBNetworkResponse new];
    reponse.errMsg = dic[@"respMsg"];
    reponse.respData = dic[@"data"];
    id code = dic[@"respCode"];
    NSInteger errCode = 408;
    if ([code isKindOfClass:[NSNumber class]]) {
        errCode = [(NSNumber *)code integerValue];
    }
    else if ([code isKindOfClass:[NSString class]]) {
        errCode = [(NSString *)code integerValue];
    }
    reponse.errCode = errCode;
    reponse.isSuccess = errCode == 0 ? YES : NO;
    return reponse;
}

- (void)printLog:(HBNetworkRequest *)request
         reponse:(HBNetworkResponse *)response {
    NSURL *base = [NSURL URLWithString:request.baseUrl];
    NSString *url = [NSURL URLWithString:request.requestUrl relativeToURL:base].absoluteString;
    id para = request.requestArgument;
    if (!para) {
        para = @{};
    }
    
    double requestTimer = (request.endInterval - request.startInterval) * 1000;
    NSString *interval = [NSString stringWithFormat:@"Http请求: %.fms", requestTimer];
    
    if (response.isSuccess) {
        if (requestTimer > 3) { //if (requestTimer > 300) {
            NSLog(@"requestUrl: %@\n %@ (接口响应时间超过300ms) \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
        }
        else {
            NSLog(@"requestUrl: %@\n %@ \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
        }
    }
    else {
        NSLog(@"requestUrl: %@\n %@ \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
    }
}

@end
