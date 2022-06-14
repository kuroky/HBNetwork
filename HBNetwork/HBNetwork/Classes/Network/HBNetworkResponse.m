//
//  HBNetworkResponse.m
//  HBNetwork
//
//  Created by BingYan on 2021/8/31.
//

#import "HBNetworkResponse.h"

@implementation HBNetworkResponse

- (NSString *)description {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:_errMsg forKey:@"errMsg"];
    [data setValue:@(_errCode) forKey:@"errCode"];
    [data setValue:_respData forKey:@"data"];
    return [NSString stringWithFormat:@"<%@:%p>:%@",[self class], &self, data];
}

- (NSString *)debugDescription {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:_errMsg forKey:@"errMsg"];
    [data setValue:@(_errCode) forKey:@"errCode"];
    [data setValue:_respData forKey:@"data"];
    return [NSString stringWithFormat:@"<%@:%p>:%@",[self class], &self, data];
}

@end
