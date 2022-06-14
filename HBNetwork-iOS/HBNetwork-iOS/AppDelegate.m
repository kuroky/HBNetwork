//
//  AppDelegate.m
//  HBNetwork-iOS
//
//  Created by BingYan on 2021/8/31.
//

#import "AppDelegate.h"
#import <AFNetworking/AFSecurityPolicy.h>
#import <HBNetwork/HBNetworkManager.h>
#import <HBNetwork/HBNetworkConfig.h>
#import "HBNetworkhandle.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    HBNetworkConfig *config = [HBNetworkConfig new];
    config.baseUrl = @"https://172.16.80.6:10001";
    config.securityPolicy = [self fetchSecurityPolicy]; // https设置
    [[HBNetworkManager sharedManager] addConfig:config];
    [[HBNetworkManager sharedManager] configHandleDelegate:[HBNetworkhandle handler]];
    
    return YES;
}

- (AFSecurityPolicy *)fetchSecurityPolicy {
    AFSecurityPolicy *policy; // 由服务端校验
    policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.validatesDomainName = NO; // 是否验证域名
    policy.allowInvalidCertificates = YES;
    return policy;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
