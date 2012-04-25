//
//  NSObject+KKJSON.m
//
//  Created by Arthur Kim on 2/16/12.
//  Copyright (c) 2012 Kakao Corp. All rights reserved.
//

#import "KKJSON.h"
#import "JSONKit.h"

#define USE_JSONKit

#ifdef USE_JSONKit

// deserializing
@implementation NSData (KKJSON)

- (id)KTobjectFromJSONData
{
    return [self objectFromJSONData];
}

@end

@implementation NSString (KKJSON)

- (id)KTobjectFromJSONString
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

#elif USE_YAJL
// deserializing
@implementation NSData (KKJSON)

- (id)KTobjectFromJSONData
{
    return [self yajl_JSON];
}

@end

@implementation NSString (KKJSON)

- (id)KTobjectFromJSONString
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