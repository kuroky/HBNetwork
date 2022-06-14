
## HB网络层组件
### 说明
基于[AFNetworking](https://github.com/AFNetworking/AFNetworking)和[YTKNetwork](https://github.com/yuantiku/YTKNetwork)的网络组件

### 安装要求

```Swift
iOS 11.0

pod 'HBNetwork', :git => 'http://172.16.80.5:22331/hebo_ios/hbnetwork.git', :tag => '1.0.0' 
```

### 文件结构

```Swift
"HBNetworkHandleDelegate.h" // 业务代理
"HBNetworkConfig.h" // 配置
"HBNetworkManager.h" // 管理
"HBNetworkRequest.h" // 请求类
"HBNetworkResponse.h" // 返回数据
```

### 使用
定义处理类
实现HBNetworkHandleDelegate

```Swift
NetworkHandler类

基于业务层的统一处理
 1. Http header 传参
 2. Reponse 解析
 3. 异常code处理
 4. log打印
```

### 初始化

```Swift
# Appdelegate.m
#import <HBNetwork/HBNetworkConfig.h>
#import <HBNetwork/HBNetworkManager.h>
#import "NetworkHandler.h"

HBNetworkConfig *config = [HBNetworkConfig new];
config.baseUrl = @"http://192.168.16.197:9093";
// config.securityPolicy = []; // https设置
[[HBNetworkManager sharedManager] addConfig:config];
[[HBNetworkManager sharedManager] configHandleDelegate:[NetworkHandler handler]];

```

### 请求类

```Swift
# TestRequest.m

- (NSString *)requestUrl; // 请求url 

// 请求方法
- (YTKRequestMethod)requestMethod //  默认为Post

// 超时时间
- (NSTimeInterval)requestTimeoutInterval  //  默认15

// 请求body
- (id)requestArgument 
```
