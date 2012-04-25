//
//  NSObject+KKJSON.h
//
//  Created by Arthur Kim on 2/16/12.
//  Copyright (c) 2012 Kakao Corp. All rights reserved.
//
#import <Foundation/Foundation.h>

#pragma mark - deserializing

@interface NSData (KKJSON)

- (id)KTobjectFromJSONData;

@end

@interface NSString (KKJSON)

- (id)KTobjectFromJSONString;

@end

#pragma mark - serializing

@interface NSArray (KKJSON)

- (NSData *)KKJSONData;
- (NSString *)KKJSONString;

@end

@interface NSDictionary (KKJSON)

- (NSData *)KKJSONData;
- (NSString *)KKJSONString;

@end
