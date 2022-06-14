//
//  ViewController.m
//  HBNetwork-iOS
//
//  Created by BingYan on 2021/8/31.
//

#import "ViewController.h"
#import "VersionCheck.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"请求" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(doRequest) forControlEvents:UIControlEventTouchUpInside];
}

- (void)doRequest {
    VersionCheck *request = [VersionCheck new];
    [request hb_requestWithCompletion:^(HBNetworkResponse * _Nonnull response) {
        if (response.isSuccess) {
            NSLog(@"success");
        }
        else {
            NSLog(@"fail");
        }        
    }];
}

@end
