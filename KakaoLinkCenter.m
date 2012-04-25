//
// Copyright 2011 Kakao Corp. All rights reserved.
// @author kakaolink@kakao.com
// @version 2.0
//
#import "KakaoLinkCenter.h"
#import "KKJSON.h"

static NSString *StringByAddingPercentEscapesForURLArgument(NSString *string) {
	NSString *escapedString = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
																				  (CFStringRef)string,
																				  NULL,
																				  (CFStringRef)@"!*'();:@&=+$,/?%#[]",
																				  kCFStringEncodingUTF8);
	return [escapedString autorelease];
}

static NSString *HTTPArgumentsStringForParameters(NSDictionary *parameters) {
	NSMutableArray *arguments = [NSMutableArray array];
    
	for (NSString *key in parameters) {
		NSString *parameter = [NSString stringWithFormat:@"%@=%@", key, StringByAddingPercentEscapesForURLArgument([parameters objectForKey:key])];
		[arguments addObject:parameter];
	}
	
	return [arguments componentsJoinedByString:@"&"];
}

static NSString *const KakaoLinkApiVerstion = @"2.0";
static NSString *const KakaoLinkURLBaseString = @"kakaolink://sendurl";

@implementation KakaoLinkCenter

#pragma mark -

+ (NSString *)kakaoLinkURLStringForParameters:(NSDictionary *)parameters {
	NSString *argumentsString = HTTPArgumentsStringForParameters(parameters);
	NSString *URLString = [NSString stringWithFormat:@"%@?%@", KakaoLinkURLBaseString, argumentsString];
	return URLString;
}

+ (BOOL)openKakaoLinkWithParams:(NSDictionary *)params {
    NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:params];
    [_params setObject:KakaoLinkApiVerstion forKey:@"apiver"];
    
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self kakaoLinkURLStringForParameters:_params]]];
}

#pragma mark -

+ (BOOL)canOpenKakaoLink {
	return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:KakaoLinkURLBaseString]];
}

+ (BOOL)openKakaoLinkWithURL:(NSString *)referenceURLString
				  appVersion:(NSString *)appVersion
				 appBundleID:(NSString *)appBundleID 
                     appName:(NSString *)appName 
					 message:(NSString *)message {
	if (!referenceURLString || !message || !appVersion || !appBundleID ||!appName) 
		return NO;
	
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                referenceURLString, @"url",
                                message, @"msg",
                                appVersion, @"appver",
                                appBundleID, @"appid",
                                appName, @"appname",
                                @"link", @"type",
                                nil];
    
	return [self openKakaoLinkWithParams:parameters];
}


+ (BOOL)openKakaoAppLinkWithMessage:(NSString *)message
								URL:(NSString *)referenceURLString
						appBundleID:(NSString *)appBundleID
						 appVersion:(NSString *)appVersion
							appName:(NSString *)appName
					  metaInfoArray:(NSArray *)metaInfoArray {
	
	BOOL avalibleAppLink = !message || !appVersion || !appBundleID || !appName || !metaInfoArray || [metaInfoArray count] > 0;
	if (!avalibleAppLink)
		return NO;
    
    NSString *appDataString = [[NSDictionary dictionaryWithObject:metaInfoArray forKey:@"metainfo"] KKJSONString];
    if ( appDataString == nil )
        return NO;
    
	NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       referenceURLString, @"url",
                                       message, @"msg",
                                       appVersion, @"appver",
                                       appBundleID, @"appid",
                                       appName, @"appname",
                                       @"app", @"type",
                                       appDataString, @"metainfo",
                                       nil];
    
	return [self openKakaoLinkWithParams:parameters];
}
@end
