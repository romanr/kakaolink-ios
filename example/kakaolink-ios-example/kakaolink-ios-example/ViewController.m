//
//  ViewController.m
//  kakaolink-ios-example
//
//  Created by Arthur Kim on 4/25/12.
//  Copyright (c) 2012 KAKAO Corp. All rights reserved.
//

#import "ViewController.h"
#import "KakaoLinkCenter.h"

@implementation ViewController

-(IBAction)kakaoLink:(id)sender {
    NSMutableArray *metaInfoArray = [NSMutableArray array];
    
    NSDictionary *metaInfoAndroid = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"android", @"os",
                                     @"phone", @"devicetype",
                                     @"market://details?id=com.kakao.talk", @"installurl",
                                     @"example://example", @"executeurl",
                                     nil];
    
    NSDictionary *metaInfoIOS = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"ios", @"os",
                                 @"phone", @"devicetype",
                                 @"http://itunes.apple.com/app/id362057947?mt=8", @"installurl", 
                                 @"example://example", @"executeurl",
                                 nil];
    
    [metaInfoArray addObject:metaInfoAndroid];
    [metaInfoArray addObject:metaInfoIOS];
    
    [KakaoLinkCenter openKakaoAppLinkWithMessage:@"First KakaoLink Message"
                                             URL:@"http://link.kakao.com/?test-ios-app"
                                     appBundleID:[[NSBundle mainBundle] bundleIdentifier]
                                      appVersion:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
                                         appName:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
                                   metaInfoArray:metaInfoArray];
}

@end
