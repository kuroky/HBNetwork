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
    config.baseUrl = @"http://report-gateway-test.waooo.com:10003";
    config.securityPolicy = [[HBNetworkhandle handler] fetchSecurityPolicy]; // https设置
    [[HBNetworkManager sharedManager] addConfig:config];
    [[HBNetworkManager sharedManager] configHandleDelegate:[HBNetworkhandle handler]];
    
    return YES;
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
