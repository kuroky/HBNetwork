//
//  VersionCheck.m
//  HBNetwork-iOS
//
//  Created by BingYan on 2021/8/31.
//

#import "VersionCheck.h"

@implementation VersionCheck

- (NSString *)requestUrl {
    return @"/v1/login/version";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSTimeInterval)requestTimeoutInterval {
    return 15;
}

- (id)requestArgument {
    return @{};
}

@end
