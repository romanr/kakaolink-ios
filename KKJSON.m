//
//  NSObject+KKJSON.m
//
//  Created by Arthur Kim on 2/16/12.
//  Copyright (c) 2012 Kakao Corp. All rights reserved.
//

#import "KKJSON.h"

#define USE_JSONKit

#ifdef USE_JSONKit
#import "JSONKit.h"

// deserializing
@implementation NSData (KKJSON)

- (id)KKobjectFromJSONData
{
    return [self objectFromJSONData];
}

@end

@implementation NSString (KKJSON)

- (id)KKobjectFromJSONString
{
    return [self objectFromJSONString];
}

@end

// serializing
@implementation NSArray (KKJSON)

- (NSData *)KKJSONData
{
    return [self JSONData];
}

- (NSString *)KKJSONString
{
    return [self JSONString];
}

@end

@implementation NSDictionary (KKJSON)

- (NSData *)KKJSONData
{
    return [self JSONData];
}

- (NSString *)KKJSONString
{
    return [self JSONString];
}

@end
#endif

#ifdef USE_YAJL
#import <YAJLiOS/YAJL.h>

/*
 When use YAJLiOS, don't forget for build settings
 - Other Linker Flags : -all_load -ObjC
 - Framework Search Paths
 */

// deserializing
@implementation NSData (KKJSON)

- (id)KKobjectFromJSONData
{
    return [self yajl_JSON];
}

@end

@implementation NSString (KKJSON)

- (id)KKobjectFromJSONString
{
    return [self yajl_JSON];
}

@end

// serializing
@implementation NSArray (KKJSON)

- (NSData *)KKJSONData
{
    //  not supported in YAJL
    return nil;
}

- (NSString *)KKJSONString
{
    return [self yajl_JSONString];
}


@end

@implementation NSDictionary (KKJSON)

- (NSData *)KKJSONData
{
    //  not supported in YAJL
    return nil;
}

- (NSString *)KKJSONString
{
    return [self yajl_JSONString];
    
}

@end

#endif