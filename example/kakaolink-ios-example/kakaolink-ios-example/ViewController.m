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
    if (![KakaoLinkCenter canOpenKakaoLink]) {
        return;
    }

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

- (IBAction)sendTextOnlyStorylinkAction:(id)sender
{
	if (![KakaoLinkCenter canOpenStoryLink]) {
		return;
	}
	
	[KakaoLinkCenter openStoryLinkWithPost:@"text from StoryLink"
							   appBundleID:[[NSBundle mainBundle] bundleIdentifier]
								appVersion:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
								   appName:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
								   urlInfo:nil];
}

- (IBAction)sendStorylinkHasCorrectUrlInfoAction:(id)sender
{
	if (![KakaoLinkCenter canOpenStoryLink]) {
		return;
	}
	
	NSArray *imageArray = [NSArray arrayWithObject:@"http://i4.ytimg.com/vi/gU2-ZMWm0xc/default.jpg"];
	NSDictionary *urlInfoDict = [NSDictionary dictionaryWithObjectsAndKeys:
								 @"CloudAthlas", @"title",
								 @"blahblahblah", @"desc",
								 imageArray, @"imageurl",
								 nil];
	
	[KakaoLinkCenter openStoryLinkWithPost:@"text from Storylink http://www.youtube.com/watch?v=gU2-ZMWm0xc&feature=g-vrec"
							   appBundleID:[[NSBundle mainBundle] bundleIdentifier]
								appVersion:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
								   appName:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
								   urlInfo:urlInfoDict];
}

- (IBAction)sendStorylinkWithoutUrlInfoAction:(id)sender
{
	if (![KakaoLinkCenter canOpenStoryLink]) {
		return;
	}
	
	[KakaoLinkCenter openStoryLinkWithPost:@"text from Storylink http://www.youtube.com/watch?v=gU2-ZMWm0xc&feature=g-vrec"
							   appBundleID:[[NSBundle mainBundle] bundleIdentifier]
								appVersion:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
								   appName:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
								   urlInfo:nil];
}

- (IBAction)sendStorylinkHasIncorrectUrlInfoAction:(id)sender
{
	if (![KakaoLinkCenter canOpenStoryLink]) {
		return;
	}
	
	NSArray *imageArray = [NSArray arrayWithObject:@"http://i4.ytimg.com/vi/gU2-ZMWm0xc/default.jpg"];
	NSDictionary *urlInfoDict = [NSDictionary dictionaryWithObjectsAndKeys:
								 @"blahblahblah", @"desc",
								 imageArray, @"imageurl",
								 nil];
	
	[KakaoLinkCenter openStoryLinkWithPost:@"text from Storylink http://www.youtube.com/watch?v=gU2-ZMWm0xc&feature=g-vrec story posting"
							   appBundleID:[[NSBundle mainBundle] bundleIdentifier]
								appVersion:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
								   appName:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
								   urlInfo:urlInfoDict];
}

@end
